import os, sys

try:
    import json
except:
    sys.stderr.write("Error: Python JSON module unavailable.\n");
    exit(-1)

def load(filename):
    with file(filename, 'r') as in_file:
        return json.load(in_file)
    return None

def save(db, filename):
    with file(filename, 'w') as out_file:
        json.dump(db, fp=out_file, 
                  indent=2, sort_keys=True, separators=(',', ' : '))

def str(db):
    return json.dumps(db,
                      indent=2, sort_keys=True, separators=(',', ' : '))

def find_ff_params(db,
                   ptype,
                   potential=None,
                   atypes=None):
    """
    Access a force field term for the given types
      Args:
        db (dict): Parameters database (must have a 'params' entry)
        ptype (str): Type of parameter (e.g. 'pair')
        potential (str): Type of potential (e.g. 'lj9_6')
        atypes (tuple): CG "atom" types (e.g. ('CM', 'CT'))
      Returns:
        Force field entry
    """
    results = []
    for p in db['params']:
        match = True
        if (ptype):
            if (p['param'] != ptype): match = False
        if (potential):
            if (p['potential'] != potential): match = False
        if (atypes):
            atypes = list(atypes)
            if ((p['types'] != atypes) and 
                (p['types'] != atypes[::-1])): match = False
        if (match):
            results += [p]
    if (len(results) == 0): return None
    if (len(results) == 1): return results[0]
    return results

    
