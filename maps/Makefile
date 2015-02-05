# -*- makefile -*-

TCL = $(shell which tclsh8.5)
PYTHON = $(shell which python)
FILES = $(shell ls map_*.tcl)
JSBEAUTIFY = "../tools/js-beautify/python/js-beautify"

VERSION = 1

.PHONY: clean all top_all$(VERSION)_sdk.json

complete_tops = top_all$(VERSION)_sdk.json

all: $(complete_tops)

clean:
	rm -f $(complete_tops)

top_all$(VERSION)_sdk.json:
	$(TCL) ../tools/map2json.tcl $(FILES) > tmp.json 
	$(PYTHON) $(JSBEAUTIFY) tmp.json > $@ && \
	       	rm -f tmp.json 

test:
	for i in map_*.tcl; do $(TCL) $$i; done 
