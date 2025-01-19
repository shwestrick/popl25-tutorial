structure Solution:
sig
  val findFirst: int * int -> (int -> bool) -> int option
end =
struct

  fun optMin (a, b) =
    case (a, b) of
      (SOME x, SOME y) => (SOME (Int.min (x, y)))
    | (NONE, _) => b
    | (_, NONE) => a


  fun findFirst (lo, hi) pred =
    let
      fun try (i, j) =
        Parallel.reduce optMin NONE (i, j)
        (fn k => if pred k then SOME k else NONE)

      fun loop (i, j) =
        if i >= j then NONE else
        case try (i, j) of
          NONE => loop (j, Int.min (j + 2*(j-i), hi))
        | SOME x => SOME x

      val initialSize = 100
    in
      loop (lo, Int.min (lo+initialSize, hi))
    end

end