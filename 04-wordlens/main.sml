val filename = List.hd (CommandLineArgs.positional ())
               handle _ => Util.die "Usage: ./main <FILE>"

val impl = CommandLineArgs.parseString "impl" "wordlens"

val wordlens =
  case impl of
    "wordlens" => WordLens.wordlens
  | "solution" => Solution.wordlens
  | _ =>
      Util.die
        ("unknown -impl " ^ impl ^ "\nvalid options are: wordlens solution")

val _ = print ("impl " ^ impl ^ "\n")

val contents = ReadFile.contentsSeq filename
val hist = TutorialBenchmark.run (fn _ => wordlens contents)
val hist = IntHist.view hist

val _ = print "\n"
val _ = Util.for (0, Seq.length hist) (fn i =>
  let
    val (k, v) = Seq.nth hist i
  in
    print ("\t" ^ Int.toString k ^ "\t" ^ Int.toString v ^ "\n")
  end)
