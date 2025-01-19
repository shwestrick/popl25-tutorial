fun fib n =
  if n < 2 then
    n
  else
    let
      val (a, b) =
        ForkJoin.par (fn () => fib (n-1),
                      fn () => fib (n-2))
    in
      a + b
    end
