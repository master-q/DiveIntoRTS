all: SizeOfString
SizeOfString: SizeOfString.hs
	/usr/local/ghc7.4.1/bin/ghc -eventlog -debug -rtsopts SizeOfString.hs

run_debug: SizeOfString
	./SizeOfString +RTS -V0 \
	-Ds -Di -Dw -DG -Dg -Db -DS -Dt -Dp -Da -Dl -Dm -Dz -Dc -Dr

clean:
	rm -f *.o *.hi *~ SizeOfString

.PHONY: clean run_debug
