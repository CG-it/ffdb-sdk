## Construct *_all.dat parameter files automatically

.PHONY: clean all

VERSION = 1.0

complete_databases = param_lj_sdk_all.dat param_bond_sdk_all.dat param_angle_sdk_all.dat

all: $(complete_databases)

clean:
	rm -f $(complete_databases)

install:
	mkdir -p ${HOME}/.vmdplugins/cgtools${VERSION}/sdk 2>/dev/null || :
	rsync -av --include-from=.rsync-include --exclude="*" . ${HOME}/.vmdplugins/cgtools${VERSION}/sdk/.

param_lj_sdk_all.dat: param_lj_sdk_surfactants.dat param_lj_sdk_phospholipids.dat
	python write_params.py $^ | sort -k 2,3 > $@

param_bond_sdk_all.dat: param_bond_sdk_surfactants.dat param_bond_sdk_phospholipids.dat
	cat $^ | sort -k 2,3 > $@

param_angle_sdk_all.dat: param_angle_sdk_surfactants.dat param_angle_sdk_phospholipids.dat
	cat $^ | sort -k 2,3 > $@

# Update list of files to be installed
update:
	rm -rf .rsync-include 2>/dev/null || :
	git archive HEAD | tar -t > .rsync-include


