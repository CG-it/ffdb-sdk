TCL = $(shell which tclsh8.5)
GIT = $(shell which git)

VERSION = 1

.PHONY: all clean par_all${VERSION}_sdk.json par_all${VERSION}_sdk.dat top_all${VERSION}_sdk.json

complete_databases = par_all${VERSION}_sdk.dat par_all${VERSION}_sdk.json 
complete_tops = top_all${VERSION}_sdk.json

print-%: ; @echo $*=$($*)

all: $(complete_databases) $(complete_tops)

clean:
	cd src; make -f Makefile clean
	rm -f $(complete_databases)
	rm -f $(complete_tops) 

par_all${VERSION}_sdk.json: par_all${VERSION}_sdk.dat
	@cd src; \
	$(TCL) ../tools/param2json.tcl $^ > $@
	@mv src/$@ .

par_all${VERSION}_sdk.dat:
	@cd src; \
	$(MAKE) "VERSION = $(VERSION)" -f Makefile

top_all${VERSION}_sdk.json:
	@cd maps; \
	$(MAKE) "VERSION = $(VERSION)" -f Makefile
	@mv maps/$@ .

hooks:
	cp tools/pre-commit .git/hooks/.

## Install the JS beautifier to cleanup generated json 
install-js-beautify:
	$(GIT) clone https://github.com/beautify-web/js-beautify.git \
	       	tools/js-beautify
