#!/usr/bin/tclsh

# +----------+
# | CG-Tools |
# +----------+

# CGtools, a VMD package to simplify creating coarse grained SDK 
# topologies.

# Copyright (c) 2013 by Chris MacDermaid <chris.macdermaid@gmail.com>
# and Giacomo Fiorin <giacomo.fiorin@gmail.com>

#(Shinoda) Shinoda, DeVane, Klein, Mol Sim, 33, 27 (2007).
#(DeVane) Shinoda, DeVane, Klein, Soft Matter, 4, 2453-2462 (2008).

if {![namespace exists ::CGtools]} {
    namespace eval ::CGtools:: {
        variable maptest 1
	# Testing functions for consistency
	if {[catch {source common.tcl} msg]} {
	    puts "Unable to load common map functions.\
	    File should be loaded from 'maps' directory"
	    exit 1
	}
    }
}

# Loading CG mappings from map_nmf.tcl
# ========= NMF =========
#      charge NMF     2
#        mass NMF     2
#        name NMF     2
#     segname NMF     2
#        type NMF     2
# 
# charge NMF | mass NMF | name NMF | segname NMF        | type NMF |
# 0.0        | 29.0184  | CO       | HA C O             | T1       |
# 0.0        | 30.0500  | NC       | N H CR HR1 HR2 HR3 | T2       |

## Map for N-methylformamide
proc ::CGtools::map_NMF {} {

    variable map

    

    # +-------------+
    # |   NMF       |
    # +-------------+

    ## Lists of atom names to coarse grain from the all-atom model
    ## specified as lists. Each grouping corresponds to a CG "bead"
    set map([list segname NMF]) {
      { HA C O }
      { N H CR HR1 HR2 HR3}
    }

    ## Bead Types
    set map([list type NMF])    {T1 T2}

    ## Bead Names
    set map([list name NMF])    {CO NC}

    ## Bead Charges
    set map([list charge NMF])  { 0.0 0.0 }
    
    ## Bead Masses
    set map([list mass NMF])    { 29.0184 30.0500 }
    
    ## Bonds between beads, specified a list of doublets of atom
    ## names: {{C1 C2} {C2 C3}} Can also be {none}
    set map([list bonds NMF])   { {CO NC} }

    ## Angles between beads, specified a list of triplets of atom
    ## names: {{C1 C2 C3} {C2 C3 C4}} Can also be {none} or {auto}
    set map([list angles NMF])  { {none} }

    return

}

::CGtools::map_NMF

if { $::CGtools::maptest } {
    ::CGtools::map_stats   NMF
    ::CGtools::checkbonds  NMF
    ::CGtools::checkangles NMF
}
