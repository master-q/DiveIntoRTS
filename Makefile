all: Main
Main: Main.hs
	/usr/local/ghc7.4.1/bin/ghc -eventlog -debug -rtsopts Main.hs

Main_keeptmp: Main.hs
	/usr/local/ghc7.4.1/bin/ghc -o Main_keeptmp \
	-keep-tmp-files -tmpdir ./tmp -eventlog -debug -rtsopts Main.hs

run_debug: Main
	./Main +RTS -V0 \
	-Ds -Di -Dw -DG -Dg -Db -DS -Dt -Dp -Da -Dl -Dm -Dz -Dc -Dr

run_keeptmp: Main_keeptmp
	./Main_keeptmp

clean:
	rm -f Main_keeptmp *.o *.hi *~

.PHONY: clean run_debug run_keeptmp
