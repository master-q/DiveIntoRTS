GHC := /usr/local/ghc7.4.1/bin/ghc

all: SizeOfString
SizeOfString: SizeOfString.hs
	${GHC} -eventlog -debug -rtsopts SizeOfString.hs

%.cmm: %.hs
	${GHC} -ddump-cmm $< > $@

run_debug: SizeOfString
	./SizeOfString +RTS -V0 \
	-Ds -Di -Dw -DG -Dg -Db -DS -Dt -Dp -Da -Dl -Dm -Dz -Dc -Dr

clean:
	rm -f *.o *.hi *.cmm *~ SizeOfString

.PHONY: clean run_debug
