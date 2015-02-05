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

#Loading CG mappings from map_ffa.tcl
#========= BENA =========
#    charge BENA     8
#      mass BENA     8
#      name BENA     8
#   map BENA     8
#      type BENA     8
# 
#charge BENA | mass BENA | name BENA | map BENA | type BENA |
#0.0         | 100.0     | O2        | C O1 O2      | COO       |
#0.0         | 100.0     | C1        | C1 C2 C3     | CM        |
#0.0         | 100.0     | C2        | C4 C5 C6     | CM        |
#0.0         | 100.0     | C3        | C7 C8 C9     | CM        |
#0.0         | 100.0     | C4        | C10 C11 C12  | CM        |
#0.0         | 100.0     | C5        | C13 C14 C15  | CM        |
#0.0         | 100.0     | C6        | C16 C17 C18  | CM        |
#0.0         | 100.0     | C7        | C19 C20 C21  | CT        |
# 
#========= BENP =========
#    charge BENP     8
#      mass BENP     8
#      name BENP     8
#   map BENP     8
#      type BENP     8
# 
#charge BENP | mass BENP | name BENP | map BENP | type BENP |
#0.0         | 100.0     | O2        | C O1 O2      | COO       |
#0.0         | 100.0     | C1        | C1 C2 C3     | CM        |
#0.0         | 100.0     | C2        | C4 C5 C6     | CM        |
#0.0         | 100.0     | C3        | C7 C8 C9     | CM        |
#0.0         | 100.0     | C4        | C10 C11 C12  | CM        |
#0.0         | 100.0     | C5        | C13 C14 C15  | CM        |
#0.0         | 100.0     | C6        | C16 C17 C18  | CM        |
#0.0         | 100.0     | C7        | C19 C20 C21  | CT        |


if {![namespace exists ::CGtools]} {
    namespace eval ::CGtools:: {
        variable maptest 1
        source common.tcl ;# Testing functions for consistency
    }
}

# +-------------------------------------------------+
# | # !! WHAT FOLLOWS ARE FAKE CG MODELS !! (GF) ## |
# +-------------------------------------------------+


proc ::CGtools::map_ffa {} {

    variable map

    

    set map([list map BENA]) {
        {C O1 O2}
        {C1 C2 C3}
        {C4 C5 C6}
        {C7 C8 C9}
        {C10 C11 C12}
        {C13 C14 C15}
        {C16 C17 C18}
        {C19 C20 C21}
    }

    set map([list type BENA])    {
        COO
        CM
        CM
        CM
        CM
        CM
        CM
        CT
    }

    set map([list name BENA])    {
        O2
        C1
        C2
        C3
        C4
        C5
        C6
        C7
    }

    set map([list charge BENA])  {
        0.0
        0.0
        0.0
        0.0
        0.0
        0.0
        0.0
        0.0
    }

    set map([list mass BENA])    {
        100.0
        100.0
        100.0
        100.0
        100.0
        100.0
        100.0
        100.0
    }


    set map([list bonds BENA]) {
        {O2 C1}
        {C1 C2}
        {C2 C3}
        {C3 C4}
        {C4 C5}
        {C5 C6}
        {C6 C7}
    }


    set map([list map BENP]) $map([list map BENA])
    set map([list type BENP])    $map([list type BENA])
    set map([list name BENP])    $map([list name BENA])
    set map([list charge BENP])  $map([list charge BENA])
    set map([list mass BENP])    $map([list mass BENA])
    set map([list bonds BENP])   $map([list bonds BENA])

    return

}

::CGtools::map_ffa

if { $::CGtools::maptest } {
    ::CGtools::map_stats {BENA BENP}
}
