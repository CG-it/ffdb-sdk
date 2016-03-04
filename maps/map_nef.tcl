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

## Map for N-ethylformamide (for phosphosphingomyelin)
proc ::CGtools::map_NEF {} {

    variable map



    # +-------------+
    # |   NEF       |
    # +-------------+

    ## Lists of atom names to coarse grain from the all-atom model
    ## specified as lists. Each grouping corresponds to a CG "bead"
    set map([list map NEF]) {
      { H1 C3 O1 }
      { N1 H7 C1 H2 H3 C2 H4 H5 H6 }
    }

    ## Bead Types
    set map([list type NEF])    {T1 T2}

    ## Bead Names
    set map([list name NEF])    {CO NE}

    ## Bead Charges
    set map([list charge NEF])  { 0.0 0.0 }

    ## Bead Masses
    set map([list mass NEF])    { 29.0184 42.061 }

    ## Bonds between beads, specified a list of doublets of atom
    ## names: {{C1 C2} {C2 C3}} Can also be {none}
    set map([list bonds NEF])   { {CO NE} }

    ## Angles between beads, specified a list of triplets of atom
    ## names: {{C1 C2 C3} {C2 C3 C4}} Can also be {none} or {auto}
    set map([list angles NEF])  { {none} }

    return

}

::CGtools::map_NEF

if { $::CGtools::maptest } {
    ::CGtools::map_stats   NEF
    ::CGtools::checkbonds  NEF
    ::CGtools::checkangles NEF
}
