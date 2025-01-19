(* do f(lo) ... f(hi-1) in parallel *)
fun parfor (lo, hi) f =
  if lo >= hi then
    ()
  else if hi - lo = 1 then
    f(lo)
  else
    let
      val mid = lo + (hi - lo) div 2
    in
      ForkJoin.par (fn () => parfor (lo, mid) f,
                    fn () => parfor (mid, hi) f);
      ()
    end


fun reduce g z (lo, hi) f =
  if lo >= hi then
    z
  else if hi - lo = 1 then
    f(lo)
  else
    let
      val mid = lo + (hi - lo) div 2
      val (a, b) =
        ForkJoin.par (fn () => reduce g z (lo, mid) f,
                      fn () => reduce g z (mid, hi) f)
    in
      g (a, b)
    end


(* build an array [f(lo), ..., f(hi-1)] in parallel *)
fun tabulate (lo, hi) (f: int -> 'a) : 'a array =
  let
    val n = hi - lo
    val output = ForkJoin.alloc n
  in
    parfor (0, n) (fn i => Array.update (output, i, f (lo + i)));
    output
  end


(* map a function over an array in parallel *)
fun map (f: 'a -> 'b) (input: 'a array) : 'b array =
  tabulate (0, Array.length input) (fn i => f (Array.sub (input, i)))


fun tabulate (lo, hi) f =
  let
    val n = hi - lo
    val output = ForkJoin.alloc n

    (* initialize output indices i...j-1 *)
    fun init (i, j) =
      if i >= j then ()
      else if j - i = 1 then
        Array.update (output, i, f(lo+i))
      else
        let val mid = i + (j - i) div 2
        in ForkJoin.par
             (fn () => init (i, mid),
              fn () => init (mid, j));
          ()
        end
  in
    init (0, n);
    output
  end



fun scan g z (lo, hi) f =
  if hi-lo = 0 then
    Array.fromList [z]
  else if hi-lo = 1 then
    Array.fromList [z, f lo]
  else
  let
    val n = hi - lo

    val pairSums =
      tabulate (0, n div 2) (fn i =>
        g (f (lo + 2*i), f (lo + 2*i + 1)))

    val pairPrefixes =
      scan g z (0, n div 2) (fn i => Array.sub (pairSums, i))
  in
    tabulate (0, n+1) (fn i =>
      let
        val front = Array.sub (pairPrefixes, i div 2)
      in
        if i mod 2 = 0 then
          front
        else
          g (front, f (lo + i - 1))
      end)
  end


fun filter (lo, hi) f p =
  let
    val n = hi-lo
    val offsets = scan op+ 0 (lo, hi) (fn i => if p i then 1 else 0)
    val count = Array.sub (offsets, n)

    val output = ForkJoin.alloc count
  in
    parfor (0, n) (fn i =>
      if p (lo+i) then
        Array.update (output, Array.sub (offsets, i), f (lo+i))
      else
        ());
    output
  end