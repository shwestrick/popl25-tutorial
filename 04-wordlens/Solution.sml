structure Solution:
sig
  val wordlens: char Seq.t -> IntHist.t (* histogram of word lengths *)
end =
struct

  fun wordlens chars =
    let
      val n = Seq.length chars

      fun isBoundary i =
        if i = n then
          not (Char.isSpace (Seq.nth chars (n - 1)))
        else if i = 0 then
          not (Char.isSpace (Seq.nth chars 0))
        else
          let
            val s1 = Char.isSpace (Seq.nth chars i)
            val s2 = Char.isSpace (Seq.nth chars (i - 1))
          in
            (s1 andalso not s2) orelse (s2 andalso not s1)
          end

      val boundaries = Parallel.filter (0, n + 1) (fn i => i) isBoundary

      val numWords = Array.length boundaries div 2
    in
      Parallel.reduce IntHist.merge IntHist.empty (0, numWords) (fn i =>
        let
          val wordStart = Array.sub (boundaries, 2 * i)
          val wordEnd = Array.sub (boundaries, 2 * i + 1)
        in
          IntHist.singleton (wordEnd - wordStart, 1)
        end)
    end

end
