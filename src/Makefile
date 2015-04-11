# -*- makefile -*-

## Construct *_all.dat parameter files automatically

VERSION = 1

.PHONY: clean all par_all$(VERSION)_sdk.dat

complete_databases = par_all$(VERSION)_sdk.dat param_lj_sdk_all.dat \
		     param_bond_sdk_all.dat param_angle_sdk_all.dat \
		     param_dihed_sdk_all.dat

param_bond  := $(wildcard param_bond_*.dat)
param_angle := $(wildcard param_angle_*.dat)
param_dihed := $(wildcard param_dihed_*.dat)
param_lj    := $(wildcard param_lj_*.dat)

print-%: ; @echo $*=$($*)

all: $(complete_databases)

clean:
	rm -f $(complete_databases)

par_all$(VERSION)_sdk.dat: param_lj_sdk_all.dat param_bond_sdk_all.dat \
	param_angle_sdk_all.dat param_dihed_sdk_all.dat
	cat param_lj_sdk_all.dat > $@
	@echo >> $@
	cat param_bond_sdk_all.dat >> $@
	@echo >> $@
	cat param_angle_sdk_all.dat >> $@
	@echo >> $@
	cat param_dihed_sdk_all.dat >> $@
	@ rm -f param_*_all.dat

param_lj_sdk_all.dat: $(param_lj)
	python write_chol_lj_params.py $^ | sort -k 2,3 > $@

param_bond_sdk_all.dat: $(param_bond)
	egrep -hv "^#" $^ | sort -k 2,3 > $@

param_angle_sdk_all.dat: $(param_angle)
	egrep -hv "^#" $^ | sort -k 2,3 > $@

param_dihed_sdk_all.dat: $(param_dihed)
	egrep -hv "^#" $^ | sort -k 2,3 > $@
