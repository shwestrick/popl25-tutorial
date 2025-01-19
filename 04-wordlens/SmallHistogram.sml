functor SmallHistogram (type key val compare: key * key -> order):
sig
  type t
  type histogram = t

  val empty: t
  val singleton: key * int -> t
  val insert: t -> key * int -> t
  val merge: t * t -> t
  val view: t -> (key * int) Seq.t
end =
struct

  type t = (key * int) list
  type histogram = t

  val empty = []

  fun singleton (k, v) = [(k, v)]

  fun merge (h1, h2) =
    case (h1, h2) of
      ([], _) => h2
    | (_, []) => h1
    | ((k1, v1) :: h1', (k2, v2) :: h2') =>
        case compare (k1, k2) of
          LESS => (k1, v1) :: merge (h1', h2)
        | EQUAL => (k1, v1 + v2) :: merge (h1', h2')
        | GREATER => (k2, v2) :: merge (h1, h2')

  fun insert h kv =
    merge (h, singleton kv)

  fun view kv = Seq.fromList kv

end
