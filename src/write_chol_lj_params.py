# add guessed LJ parameters of new cholesterol types using base types from phospholipid and surfactants database

import os, sys, math
from lj_table import lj_table

lj = lj_table()

# parse all the arguments to this script as database files
for file in sys.argv[1:]:
    lj.parse (file)

# OAB  = branched version of OA from Mol Sim 2007 (LJ guess = OA)
# CMR  = "ring" (6-membered) version of CM from Mol Sim 2007 (LJ guess = CM)
# CMR5 = same as CMR, but for a 5-membered ring (LJ guess = CM)
# CM2  = 2-carbon version of CM from Mol Sim 2007 (LJ guess = average of CM and CT2)
# CM2R = "ring" version of CM2 (LJ guess = average of CM and CT2)
# CMDB = 3-carbon, branched version of CMD2 from JPCB 2010 (LJ guess = average of CMD2 and CM)
# CMB  = branched version of CM from Mol Sim 2007 (LJ guess = CM)
# CTB  = branched version of CT from Mol Sim 2007 (LJ guess = CT)
# CTBA = 1nd methyl group of cholesterol (LJ guess = CT2)
# CTBB = 2nd methyl group of cholesterol (LJ guess = CT2)
# C2T  = 2-methyl version of CT from Mol Sim 2007 (LJ guess = CT)


# complete the database, with all cross-interactions
# missing interactions are set to initial guesses, using one or more types as templates
for (base, deriv) in [
    (   'CT',  'C2T') ,
    (   'CM',  'CMB') ,
    (   'CT',  'CTB') ,
    (  'CT2', 'CTBA') ,
    (  'CT2', 'CTBB') ,
    (   'OA',  'OAB') ,
    (   'CM',  'CMR') ,
    (   'CM', 'CMR5') ,
    ((  'CM',  'CT2'),  'CM2') , # types with more than one base type
    ((  'CM',  'CT2'), 'CM2R') ,
    (('CMD2',   'CM'), 'CMDB')
    ]:
    lj.clone (base, deriv)


# use explicitly derived self-interaction of CM2 to rescale ALL cross-interactions
for (base, deriv, ref) in [
    ((  'CM',  'CT2'),  'CM2',  'CM2')
    ]:
    lj.rescale_interactions (types_old = base, type_new = deriv,
                             epsilon_ref = ref, sigma_ref = ref)

# use explicitly derived self-interactions to rescale cross-interactions;
# NOTE: we do this only for the new types because they are a bunch of misunderstood little bastards
for (base, deriv, ref) in [
    (   'CT',  'C2T',  'C2T') ,
    (   'CM',  'CMB',  'CMB') ,
    (   'CM',  'CMR',  'CMR') ,
    (   'CM', 'CMR5',  'CMR') ,
    ((  'CM',  'CT2'), 'CM2R', 'CM2R') ,
    (('CMD2',   'CM'), 'CMDB', 'CMDB') ,
#    (   'OA',  'OAB', 'CMB') , # we on't have this one yet
    (   'CT',  'CTB', 'CM2') ,  # based on surface tensions of branched alkanes,
    (  'CT2', 'CTBA', 'CM2') ,  # epsilon[CM2] ~ epsilon[CTB]
    (  'CT2', 'CTBB', 'CM2') ,
    ]:
    lj.rescale_interactions (types_old = base, type_new = deriv,
                             epsilon_ref = ref, sigma_ref = ref,
                             affected_types = set(['C2T', 'CMB', 'CTB', 'CTBA', 'CTBB', 'CMR', 'CMR5', 'CM2R', 'CMDB']))


# # uncomment this only if desperate:
# # makes all interactions between the new types and the old stronger by 50%
# for (base, deriv, ref) in [
#     (   'CT',  'C2T',  'C2T') ,
#     (   'CM',  'CMB',  'CMB') ,
#     (   'CM',  'CMR',  'CMR') ,
#     (   'CM', 'CMR5',  'CMR') ,
#     ((  'CM',  'CT2'), 'CM2R', 'CM2R') ,
#     (('CMD2',   'CM'), 'CMDB', 'CMDB') ,
#     (   'CT',  'CTB', 'CM2') ,
#     (  'CT2', 'CTBA', 'CM2') ,
#     (  'CT2', 'CTBB', 'CM2') ,
#     ]:
#     lj.rescale_interactions (types_old = base, type_new = deriv,
#                              epsilon_scale = 1.5, 
#                              affected_types = (lj.types () - set(['C2T', 'CMB', 'CTB', 'CTBA', 'CTBB', 'CMR', 'CMR5', 'CM2R', 'CMDB'])))




                             
sys.stdout.write (str (lj))
#sys.stderr.write (str (lj.types()))
# lots of missing ones, uncomment to see:
#lj.check_missing()
#lj.check_duplicates()
#sys.stderr.write ("# types = %d, # pairs = %d\n" % (len (lj.types()), len (lj)))


