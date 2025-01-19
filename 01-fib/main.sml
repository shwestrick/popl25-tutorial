(* Usage: main -n SIZE *)

structure CLA = CommandLineArgs
val n = CLA.parseInt "n" 40
val _ = print ("computing fib(" ^ Int.toString n ^ ")\n")
val result = TutorialBenchmark.run (fn _ => fib n)
val _ = print ("fib(" ^ Int.toString n ^ ") = " ^ Int.toString result ^ "\n")
