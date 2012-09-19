GHC := /usr/local/ghc7.4.1/bin/ghc

all: Main KnownFun.cmm
Main: Main.hs KnownFun.hs
	${GHC} -eventlog -debug -rtsopts Main.hs

Main_gdb: Main
	gdb Main

KnownFun.cmm: KnownFun.hs
	${GHC} -ddump-cmm KnownFun.hs > KnownFun.cmm

clean:
	rm -f Main *.o *.hi *.cmm *~

.PHONY: clean Main_gdb
