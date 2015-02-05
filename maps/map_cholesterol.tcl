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

# OAB  = branched version of OA from Mol Sim 2007 (LJ guess = OA)
# CMR  = "ring" (6-membered) version of CM from Mol Sim 2007 (LJ guess = CM)
# CMR5 = same as CMR, but for a 5-membered ring (LJ guess = CM)
# CM2  = 2-carbon version of CM from Mol Sim 2007 (LJ guess = average of CM and CT2)
# CM2R = "ring" version of CM2 (LJ guess = average of CM and CT2)
# CMDB = 3-carbon, branched version of CMD2 from JPCB 2010 (LJ guess = average of CMD2 and CM)
# CMB  = branched version of CM from Mol Sim 2007 (LJ guess = CM)
# CTB  = branched version of CT (LJ guess = CT)
# CTBA = 1nd methyl group of cholesterol (LJ guess = CT2)
# CTBB = 2nd methyl group of cholesterol (LJ guess = CT2)
# C2T  = 2-methyl version of CT from Mol Sim 2007 (LJ guess = CT)

# Loading CG mappings from map_cholesterol.tcl
# ========= CLOL =========
#     charge CLOL    11
#       mass CLOL    11
#       name CLOL    11
#    map CLOL    11
#       type CLOL    11
#  
# charge CLOL | mass CLOL | name CLOL | map CLOL                                  | type CLOL |
# 0.0         | 30.026    | O         | C3 H3 O3 H3'                                  | OAB       |
# 0.0         | 28.054    | C1        | C1 H1A H1B C2 H2A H2B                         | CM2R      |
# 0.0         | 39.057    | C2        | C4 H4A H4B C5 C6 H6                           | CMDB      |
# 0.0         | 27.046    | C3        | C19 H19A H19B H19C C10                        | CTBA      |
# 0.0         | 40.065    | C4        | C7 H7A H7B C8 H8 C14 H14                      | CMB       |
# 0.0         | 41.073    | C5        | C9 H9 C11 H11A H11B C12 H12A H12B             | CMR       |
# 0.0         | 41.073    | C6        | C15 H15A H15B C16 H16A H16B C17 H17           | CMR5      |
# 0.0         | 27.046    | C7        | C18 H18A H18B H18C C13                        | CTBB      |
# 0.0         | 42.081    | C8        | C21 H21A H21B H21C C20 H20 C22 H22A H22B      | CTB       |
# 0.0         | 28.054    | C9        | C23 H23A H23B C24 H24A H24B                   | CM2       |
# 0.0         | 43.089    | C10       | C25 H25 C26 H26A H26B H26C C27 H27A H27B H27C | C2T       |

#checkbonds: CLOL OK


proc ::CGtools::map_cholesterol {} {

    variable map

    

    # +--------------+
    # |  Cholesterol |
    # +--------------+

    set map([list type CLOL]) {
        OAB
        CM2R
        CMDB
        CTBA
        CMB
        CMR
        CMR5
        CTBB
        CTB
        CM2
        C2T
    }

    set map([list name CLOL]) {
        O
        C1
        C2
        C3
        C4
        C5
        C6
        C7
        C8
        C9
        C10
    }

    set map([list map CLOL]) {
        {C3 H3 O3 H3'}
        {C1 H1A H1B C2 H2A H2B}
        {C4 H4A H4B C5 C6 H6}
        {C19 H19A H19B H19C C10}
        {C7 H7A H7B C8 H8 C14 H14}
        {C9 H9 C11 H11A H11B C12 H12A H12B}
        {C15 H15A H15B C16 H16A H16B C17 H17}
        {C18 H18A H18B H18C C13}
        {C21 H21A H21B H21C C20 H20 C22 H22A H22B}
        {C23 H23A H23B C24 H24A H24B}
        {C25 H25 C26 H26A H26B H26C C27 H27A H27B H27C}
    }

    set map([list charge CLOL]) {
        0.0
        0.0
        0.0
        0.0
        0.0
        0.0
        0.0
        0.0
        0.0
        0.0
        0.0
    }

    set map([list mass CLOL]) {
        30.026
        28.054
        39.057
        27.046
        40.065
        41.073
        41.073
        27.046
        42.081
        28.054
        43.089
    }

    set map([list bonds CLOL]) {
        {O  C1}
        {O  C2}
        {C1  C3}
        {C2  C3}
        {C2  C4}
        {C3  C4}
        {C3  C5}
        {C4  C6}
        {C4  C7}
        {C5  C7}
        {C6  C7}
        {C7  C8}
        {C8  C9}
        {C9 C10}
    }

    set map([list angles CLOL]) {
      {auto}
    }

    set map([list dihedrals CLOL]) {
      {C4 C7 C8 C9}
      {C7 C8 C9 C10}
    }

    set map([list map CHL1])  $map([list map CLOL])
    set map([list type CHL1])     $map([list type CLOL])
    set map([list name CHL1])     $map([list name CLOL])
    set map([list charge CHL1])   $map([list charge CLOL])
    set map([list mass CHL1])     $map([list mass CLOL])
    set map([list bonds CHL1])    $map([list bonds CLOL])
    set map([list angles CHL1])   $map([list angles CLOL])
    set map([list dihedrals CHL1])   $map([list dihedrals CLOL])

    return
}

::CGtools::map_cholesterol

if { $::CGtools::maptest } {
    ::CGtools::map_stats CLOL
    ::CGtools::checkbonds CLOL
}
