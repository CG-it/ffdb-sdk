import os, sys

sys.path += [os.path.abspath(os.path.pardir)]

import ffdb

for filename in ['param_lj_sdk_surfactants.dat']:
    ff = {}
    ff['fftype'] = 'sdk'
    ff['params'] = []
    ffdb.add_params_textfile(ff, 'pair', filename)
    for param in ff['params']:
        param['reference'] = 'Shinoda2007'
    base = os.path.splitext(filename)[0]
    ffdb.save(ff, (base+'.json'))
