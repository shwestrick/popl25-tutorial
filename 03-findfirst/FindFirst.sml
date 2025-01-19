structure FindFirst:
sig
  val findFirst: int * int -> (int -> bool) -> int option
end =
struct

  (* Challenge: implement this function such that, if the return is
   * SOME i, then the work is O(i-lo) and span is polylog(i-lo).
   *)
  fun findFirst (lo, hi) pred =
    raise Fail "TODO: Write your solution in 03-findfirst/FindFirst.sml"

end