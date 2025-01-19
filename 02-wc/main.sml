val filename = List.hd (CommandLineArgs.positional ())
               handle _ => Util.die "Usage: ./main <FILE>"

val impl = CommandLineArgs.parseString "impl" "wc"

val wc =
  case impl of
    "wc" => WC.wc
  | "solution" => Solution.wc
  | _ =>
      Util.die
        ("unknown -impl " ^ impl ^ "\nvalid options are: wc solution")

val _ = print ("impl " ^ impl ^ "\n")

val contents = ReadFile.contentsSeq filename
val num_words = TutorialBenchmark.run (fn _ => wc contents)

val _ = print ("num words = " ^ Int.toString num_words ^ "\n")
