MPL=mpl
MLTON=mlton -codegen c
FLAGS=-default-type int64 -default-type word64

main: *.mlb *.sml
	$(MPL) $(FLAGS) main.mlb

main.mlton: *.mlb *.sml
	$(MLTON) $(FLAGS) main.mlton.mlb