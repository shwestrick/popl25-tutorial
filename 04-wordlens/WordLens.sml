structure WordLens:
sig
  val wordlens: char Seq.t -> IntHist.t (* histogram of word lengths *)
end =
struct

  fun wordlens chars =
    let
      val n = Seq.length chars

      (* Hint: define a function isBoundary(i) which for 0 <= i <= n
       * should return true if index `i` is either the beginning or end of a
       * word. (Beginnings inclusive, endings exclusive.)
       *
       * For example:
       *
       *   chars = "  hello world"
       *   n = length(chars) = 13
       *   
       *         h  e  l  l  o     w  o  r  l  d
       *   0  1  2  3  4  5  6  7  8  9  10 11 12 13
       *         ^              ^  ^              ^
       *   isBoundary(i) returns true for i = 2,7,8,13
       *)
      fun isBoundary i =
        raise Fail "Write your solution in 04-wordlens/WordLens.sml"


      (* Hint: consider using a filter...
       *
       * Syntax is
       *   Parallel.filter (lo, hi) f p
       * The arguments are:
       *   lo: int, hi: int     index range for `f` and `p`
       *   f: int -> 'a         elements f(i) : lo <= i < hi
       *   p: int -> bool       predicate p(i) : lo <= i < hi
       * The output is an array of the elements f(i) that satisfy p(i)
       *)
    in
      raise Fail "Write your solution in 04-wordlens/WordLens.sml"
    end

end
