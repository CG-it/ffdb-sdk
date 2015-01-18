.PHONY: all clean

TCL = /usr/bin/tclsh8.5
VERSION = 1

complete_databases = par_all${VERSION}_sdk.json

all: $(complete_databases)

clean:
	rm -f $(complete_databases)

par_all${VERSION}_sdk.json:
	@cd src; \
	$(TCL) ../tools/param2json.tcl *.dat > $@
	@mv src/$@ .
