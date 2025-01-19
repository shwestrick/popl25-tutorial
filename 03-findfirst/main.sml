val filename = List.hd (CommandLineArgs.positional ())
               handle _ => Util.die "Usage: ./main <FILE>"

val impl = CommandLineArgs.parseString "impl" "findfirst"

val findFirst =
  case impl of
    "findfirst" => FindFirst.findFirst
  | "solution" => Solution.findFirst
  | _ =>
      Util.die
        ("unknown -impl " ^ impl ^ "\nvalid options are: findfirst solution")

val _ = print ("impl " ^ impl ^ "\n")


val contents = ReadFile.contentsSeq filename

fun findEnd i =
  let
    val j = Solution.findFirst (i+1, Seq.length contents) (fn i =>
          Char.isSpace (Seq.nth contents i))          
  in
    case j of
            NONE => Seq.length contents
          | SOME j => j
  end

fun wordStartingWithZAndEndsWithS i =
  let
    val c = Seq.nth contents i
  in
    (c = #"z" orelse c = #"Z")
    andalso
    (i = 0 orelse Char.isSpace (Seq.nth contents (i-1)))
    andalso
    let
      val c' = Seq.nth contents (findEnd i - 1)
    in
      c' = #"s" orelse c' = #"S"
    end
  end

val result = TutorialBenchmark.run (fn _ =>
  findFirst (0, Seq.length contents) wordStartingWithZAndEndsWithS)

val _ =
  case result of
    NONE => print "found no wording starting with z\n"
  | SOME i =>
      let
        val j = findEnd i
        val word = CharVector.tabulate (j-i, fn k => Seq.nth contents (i+k))
      in
        print ("first word that starts with z and ends with s is: " ^ word ^ "\n")
      end