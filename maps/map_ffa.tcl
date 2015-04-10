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
        {C1 H11 H12 C2 H21 H22 C3 H31 H32}
        {C4 H41 H42 C5 H51 H52 C6 H61 H62}
        {C7 H71 H72 C8 H81 H82 C9 H91 H92}
        {C10 H101 H102 C11 H111 H112 C12 H121 H122}
        {C13 H131 H132 C14 H141 H142 C15 H151 H152}
        {C16 H161 H162 C17 H171 H172 C18 H181 H182}
        {C19 H191 H192 C20 H201 H202 C21 H211 H212 H213}
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
        -0.1118033989
        0.0
        0.0
        0.0
        0.0
        0.0
        0.0
        0.0
    }

    set map([list mass BENA])    {
        { 44.0095}
        { 42.0797}
        { 42.0797}
        { 42.0797}
        { 42.0797}
        { 42.0797}
        { 42.0797}
        { 43.0877}
    }

    set map([list weights BENA]) {
        {1.0 1.0 1.0}
        {1.0 1.0 1.0 1.0 1.0 1.0 1.0 1.0 1.0}
        {1.0 1.0 1.0 1.0 1.0 1.0 1.0 1.0 1.0}
        {1.0 1.0 1.0 1.0 1.0 1.0 1.0 1.0 1.0}
        {1.0 1.0 1.0 1.0 1.0 1.0 1.0 1.0 1.0}
        {1.0 1.0 1.0 1.0 1.0 1.0 1.0 1.0 1.0}
        {1.0 1.0 1.0 1.0 1.0 1.0 1.0 1.0 1.0}
        {1.0 1.0 1.0 1.0 1.0 1.0 1.0 1.0 1.0 1.0}
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

    set map([list angles BENA]) {
        {auto}
    }

    set map([list dihedrals BENA]) {
        {none}
    }


    set map([list map BENP]) {
        {C O1 O2 H}
        {C1 H11 H12 C2 H21 H22 C3 H31 H32}
        {C4 H41 H42 C5 H51 H52 C6 H61 H62}
        {C7 H71 H72 C8 H81 H82 C9 H91 H92}
        {C10 H101 H102 C11 H111 H112 C12 H121 H122}
        {C13 H131 H132 C14 H141 H142 C15 H151 H152}
        {C16 H161 H162 C17 H171 H172 C18 H181 H182}
        {C19 H191 H192 C20 H201 H202 C21 H211 H212 H213}
    }

    set map([list type BENP])    {
        COOH
        CM
        CM
        CM
        CM
        CM
        CM
        CT
    }

    set map([list name BENP])    {
        O2
        C1
        C2
        C3
        C4
        C5
        C6
        C7
    }

    set map([list charge BENP])  {
        0.0
        0.0
        0.0
        0.0
        0.0
        0.0
        0.0
        0.0
    }

    set map([list mass BENP])    {
        { 45.0174}
        { 42.0797}
        { 42.0797}
        { 42.0797}
        { 42.0797}
        { 42.0797}
        { 42.0797}
        { 43.0877}
    }

    set map([list weights BENP]) {
        {1.0 1.0 1.0 1.0}
        {1.0 1.0 1.0 1.0 1.0 1.0 1.0 1.0 1.0}
        {1.0 1.0 1.0 1.0 1.0 1.0 1.0 1.0 1.0}
        {1.0 1.0 1.0 1.0 1.0 1.0 1.0 1.0 1.0}
        {1.0 1.0 1.0 1.0 1.0 1.0 1.0 1.0 1.0}
        {1.0 1.0 1.0 1.0 1.0 1.0 1.0 1.0 1.0}
        {1.0 1.0 1.0 1.0 1.0 1.0 1.0 1.0 1.0}
        {1.0 1.0 1.0 1.0 1.0 1.0 1.0 1.0 1.0 1.0}
    }

    set map([list bonds BENP]) {
        {O2 C1}
        {C1 C2}
        {C2 C3}
        {C3 C4}
        {C4 C5}
        {C5 C6}
        {C6 C7}
    }

    set map([list angles BENP]) {
        {auto}
    }

    set map([list dihedrals BENP]) {
        {none}
    }

    ## Neutral Butyric Acid (FFA headgroup)
    ## https://en.wikipedia.org/wiki/Butyric_acid
    ## Used for Headgroup Parameterization
    ## Probably should do hexanoic too..

    set map([list map BTAP]) {
        {C O1 O2 H}
        {C1 H11 H12 C2 H21 H22 C3 H31 H32 H33}
    }

    set map([list type BTAP])    {
        COOH
        CT
    }

    set map([list name BTAP])    {
        O2
        C1
    }

    set map([list charge BTAP])  {
        0.0
        0.0
    }

    set map([list mass BTAP])    {
        45.0174
        43.0877
    }

    set map([list weights BTAP]) {
        {1.0 1.0 1.0 1.0}
        {1.0 1.0 1.0 1.0 1.0 1.0 1.0 1.0 1.0 1.0}
    }

    set map([list bonds BTAP]) {
        {O2 C1}
    }

    set map([list angles BTAP]) {
        {none}
    }

    set map([list dihedrals BTAP]) {
        {none}
    }

    return
}

::CGtools::map_ffa

if { $::CGtools::maptest } {
    ::CGtools::map_stats {BENA BENP BTAP}
}
