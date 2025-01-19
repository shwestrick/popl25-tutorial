structure Solution:
sig
  val wc: char Seq.t -> int (* number of words *)
end =
struct

  fun wc chars =
    Parallel.reduce op+ 0 (0, Seq.length chars) (fn i =>
      if
        not (Char.isSpace (Seq.nth chars i))
        andalso (i = 0 orelse Char.isSpace (Seq.nth chars (i - 1)))
      then 1
      else 0)

end
