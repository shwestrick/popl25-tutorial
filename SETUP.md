# Setup

## 1. Install `mlton`
- With Homebrew: `brew install mlton`
- Alternatively, a number of binary releases for different platforms are 
    available [here](https://github.com/MLton/mlton/releases/tag/on-20241230-release).
- As a last resort, you can build from source using the instructions in
    the [GitHub repo](https://github.com/MLton/mlton). You may need to install
    SML/NJ and then bootstrap: `make bootstrap-smlnj`

## 2. Install `mpl-switch`
A simple installer and version switcher for `mpl`. It relies on
Python 3.
```bash
$ git clone https://github.com/MPLLang/mpl-switch
# add ./mpl-switch to your PATH
$ mpl-switch init
# add ~/.mpl/bin to your PATH
```

## 3. Install `mpl`
The main compiler.
```bash
$ mpl-switch install v0.5.3
... # this will take a few minutes

$ mpl-switch select v0.5.3

$ mpl-switch show
INSTALLED VERSIONS:
  * v0.5.3

$ mpl
MLton [mpl] 20250114.032400-gf17e72680
```

## 4. Install `smlpkg`
A package manager for Standard ML.
```bash
$ git clone https://github.com/diku-dk/smlpkg
$ cd smlpkg
$ MLCOMP=mlton make clean all
# add ./src to your PATH
```

## 5. Clone this repo and run the `init` script
This will populate `lib/` with the libraries needed for this tutorial,
download `data/words.txt` (a dataset of words), and report the number of
CPUs available on your machine.
```bash
$ git clone https://github.com/shwestrick/popl25-tutorial
$ cd popl25-tutorial
$ ./init
```