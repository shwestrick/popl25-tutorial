# popl25-tutorial

This repo includes the sources for the POPL'25 tutorial MPL: Provably
Efficient Parallel Programming.

To get started, see [`SETUP.md`](./SETUP.md) for installation instructions.
This tutorial should run on both x86 Linux machines as well as either x86
or Arm-based (Apple Silicon) Macs.

There are a number of examples, including:
* [`01-fib`](./01-fib) Parallel Fibonacci, the "hello world" of parallel programming.
* [`02-wc`](./02-wc) Parallel word count.
* [`03-findfirst`](./03-findfirst) Asymptotically work-efficient parallel leftmost search.
* [`04-wordlens`](./04-wordlens/) Parallel word length histogram.

Each example includes a `Makefile`, and (except for Fibonacci) search for
`raise Fail "TODO: ..."` to see where you can write your own code.
In these directories there is also a reference solution in `Solution.sml`.
If you don't want to spoil the solution, don't look!

To run an example (here showing `02-wc`):
```bash
$ cd 02-wc
$ make   # produces `main` executable
$ ./main @mpl procs 4 -- ../data/words.txt                # this runs your code
$ ./main @mpl procs 4 -- ../data/words.txt -impl solution # this runs the reference solution
```