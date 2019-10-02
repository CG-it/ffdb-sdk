import os, sys

try:
    import json
except:
    raise ImportError("The JSON module is unavailable, please upgrade "
                      "to a recent distribution.\n")

def load(filename):
    """
    Load a force field database from a JSON file
      Args:
        filename (str): name of the JSON-formatted file
      Returns:
        Dictionary of force field parameters
    """
    with open(filename, 'r') as in_file:
        return json.load(in_file)
    return None


def add_params_textfile(db, ptype, filename):
    """
    Load non-bonded pair parameters from a text file.
    Valid comment characters are '!' and '#'; if a comment appears
    after a valid entry and on the same line, it will be included
    in the database.

      Args:
        db (dict): Database dictionary
        ptype (str): Type of entries (e.g. 'pair', 'bond', ...)
        filename (str): Name of text file

    """
    with open(filename, 'r') as in_file:
        read_pairs_text(db, in_file.read())


def add_params_text(db, ptype, text):
    """Load non-bonded pair parameters from a string
      Args:
        db (dict): Database dictionary
        ptype (str): Type of entries (e.g. 'pair', 'bond', ...)
        text (str): Input text
    """
#    if (ptype == 'pair'):


def get_param_comment(line):
    """Get the comment at the end of an entry"""
    comment_pos = 0
    if (line.find('#') > 0):
        comment = line[line.find('#')+1:]
    if (line.find('!') > 0):
        comment = line[line.find('!')+1:]
    comment = comment.lstrip('#')
    comment = comment.lstrip('!')
    comment = comment.lstrip(' ')
    return comment

def read_pairs_text(db, text):
    """Read new pair entries"""
    for line in text.splitlines():
        if ((line[:1] == '!') or (line[:1] == '#')): continue
        words = line.split()
        if (len(words) == 0): continue
        if (words[0] != 'pair'):
            raise Exception("Error: unsupported keyword \"%s\" in file." %
                            words[0])
        if (len(words) < 6):
            raise Exception("Error: insufficient number of fields in line:\n"
                            "\"%s\"\n" % line)
        (keyword, type1, type2, potential, epsilon, sigma) = words[0:6]
        comment = get_param_comment(line)
        types = (type1, type2)
        if (type1 > type2): types = (type2, type1)

        if (find_params(db, ptype='pair', atypes=types) != None):
            raise Exception("Duplicate record for pair (%s, %s)" % types)

        param = {}
        param['param'] = 'pair'
        param['types'] = types
        param['potential'] = potential
        param['epsilon'] = epsilon
        param['sigma'] = sigma
        param['comment'] = comment

        db['params'] += [param]


def add_entries(db, filename):
    """Append entries to an existing database from a JSON file"""
    with open(filename, 'r') as in_file:
        new_db = json.load(in_file)
        if (new_db['fftype'] != db['fftype']):
            raise Exception("Cannot merge databases with different \"fftype\" entries")
        if ('params' in new_db):
            if ('params' in db):
                db['params'] += new_db['params']
            else:
                db['params'] = new_db['params']
        if ('topo' in new_db):
            raise Exception("Parsing of topology entries is not implemented yet")


def save(db, filename):
    with open(filename, 'w') as out_file:
        json.dump(db, fp=out_file, 
                  indent=2, sort_keys=True, separators=(',', ' : '))

def str(db):
    return json.dumps(db,
                      indent=2, sort_keys=True, separators=(',', ' : '))

def find_params(db,
                ptype,
                potential=None,
                atypes=None):
    """
    Access a force field term for the given types
      Args:
        db (dict): Parameters database (as created from load())
        ptype (str): Type of parameter (e.g. 'pair')
        potential (str): Type of potential (e.g. 'lj9_6')
        atypes (tuple): CG "atom" types (e.g. ('CM', 'CT'))
      Returns:
        * None if no entries are found;
        * a single entry when the match is unique;
        * a list of entries if the match is not unique.
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

    
