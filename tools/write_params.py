import os, sys, math
from lj_table import lj_table

lj = lj_table()

# parse all the arguments to this script as database files
for file in sys.argv[1:]:
    lj.parse (file)

sys.stdout.write (str (lj))
