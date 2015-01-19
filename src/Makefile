# -*- makefile -*-

## Construct *_all.dat parameter files automatically

VERSION = 1

.PHONY: clean all par_all$(VERSION)_sdk.dat

complete_databases = par_all$(VERSION)_sdk.dat param_lj_sdk_all.dat param_bond_sdk_all.dat param_angle_sdk_all.dat

all: $(complete_databases)

clean:
	rm -f $(complete_databases)

par_all$(VERSION)_sdk.dat: param_lj_sdk_all.dat param_bond_sdk_all.dat param_angle_sdk_all.dat
	cat param_lj_sdk_all.dat > $@
	echo >> $@
	cat param_bond_sdk_all.dat >> $@
	echo >> $@
	cat param_angle_sdk_all.dat >> $@

param_lj_sdk_all.dat: param_lj_sdk_surfactants.dat param_lj_sdk_phospholipids.dat
	python write_params.py $^ | sort -k 2,3 > $@

param_bond_sdk_all.dat: param_bond_sdk_surfactants.dat param_bond_sdk_phospholipids.dat
	cat $^ | sort -k 2,3 > $@

param_angle_sdk_all.dat: param_angle_sdk_surfactants.dat param_angle_sdk_phospholipids.dat
	cat $^ | sort -k 2,3 > $@
