.PHONY: all clean par_all${VERSION}_sdk.json par_all${VERSION}_sdk.dat

TCL = /usr/bin/tclsh8.5
VERSION = 1

complete_databases = par_all${VERSION}_sdk.dat par_all${VERSION}_sdk.json 

all: $(complete_databases)

clean:
	cd src; make -f Makefile.clol clean
	rm -f $(complete_databases)

par_all${VERSION}_sdk.json: par_all${VERSION}_sdk.dat
	cd src; \
	$(TCL) ../tools/param2json.tcl $^ > $@
	mv src/$@ .

par_all${VERSION}_sdk.dat:
	cd src; \
	$(MAKE) "VERSION = $(VERSION)" -f Makefile.clol

