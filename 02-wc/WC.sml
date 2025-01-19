structure WC:
sig
  val wc: char Seq.t -> int (* number of words *)
end =
struct

  (* Helpful functions:
   *   Seq.length s     length of sequence s
   *   Seq.nth s i      element s[i], i.e., ith element of s
   *   Char.isSpace c   true if c is a whitespace character
   *)

  (* Hint: you can do it with one call to reduce.
   *
   * The syntax is:
   *   Parallel.reduce g z (lo, hi) f
   * The arguments are:
   *   g: 'a * 'a -> 'a    combining function (e.g., addition)
   *   z: 'a               identity value for g (e.g. 0 for addition)
   *   lo: int, hi: int    range of indices for f (inclusive lo, exclusive hi)
   *   f: int -> 'a        function to generate one element
   *)

  fun wc chars =
    raise Fail "TODO: Write your solution in 02-wc/WC.sml"

end