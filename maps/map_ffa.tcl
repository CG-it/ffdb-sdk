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

    set map([list atomicnumber BENA]) {
        22
        24
        24
        24
        24
        24
        24
        25
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

    set map([list atomicnumber BENP]) {
        22
        24
        24
        24
        24
        24
        24
        25
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

    ## Neutral Butyric Acid (FFA headgroup)
    ## https://en.wikipedia.org/wiki/Butyric_acid
    ## Used for Headgroup Parameterization
    ## Probably should do hexanoic too..

    ## Alternate mapping with alpha carbon in carboxylate bead
    ## This provides easier maps for 9-cis fatty acids
    set map([list map BTAP2]) {
        {C O1 O2 H C1 H11 H12}
        {C2 H21 H22 C3 H31 H32 H33}
    }

    set map([list type BTAP2])    {
        COOH
        CT2
    }

    set map([list name BTAP2])    {
        O2
        C1
    }

    set map([list charge BTAP2])  {
        0.0
        0.0
    }

    set map([list mass BTAP2])    {
        59.04
        29.06
    }

    set map([list weights BTAP2]) {
        {1.0 1.0 1.0 1.0 1.0 1.0 1.0}
        {1.0 1.0 1.0 1.0 1.0 1.0 1.0}
    }

    set map([list bonds BTAP2]) {
        {O2 C1}
    }

    set map([list angles BTAP2]) {
        {none}
    }

    set map([list dihedrals BTAP2]) {
        {none}
    }

    ## Neutral Pentanoic Acid (FFA headgroup)
    ## https://en.wikipedia.org/wiki/Butyric_acid

    ## Alternate mapping with alpha carbon in carboxylate bead
    ## This provides easier maps for 9-cis fatty acids
    set map([list map PENP2]) {
        {C1 O1 O2 H C2 H21 H22}
        {C3 H31 H32 C4 H41 H42 C5 H51 H52 H53}
    }

    set map([list type PENP2])    {
        COOH
        CT
    }

    set map([list name PENP2])    {
        O2
        C1
    }

    set map([list charge PENP2])  {
        0.0
        0.0
    }

    set map([list mass PENP2])    {
        59.04
        43.09
    }

    set map([list weights PENP2]) {
        {1.0 1.0 1.0 1.0 1.0 1.0 1.0}
        {1.0 1.0 1.0 1.0 1.0 1.0 1.0 1.0 1.0 1.0}
    }

    set map([list bonds PENP2]) {
        {O2 C1}
    }

    set map([list angles PENP2]) {
        {none}
    }

    set map([list dihedrals PENP2]) {
        {none}
    }

    ## Neutral Hexanoic Acid (FFA headgroup)
    ## https://en.wikipedia.org/wiki/Heptanoic_acid

    set map([list map HEXP2]) {
        {C1 O1 O2 H C2 H21 H22}
        {C3 H31 H32 C4 H41 H42}
        {C5 H51 H52 C6 H61 H62 H63}
    }

    set map([list type HEXP2])    {
        COOH
        CM2
        CT2
    }

    set map([list name HEXP2])    {
        O2
        C1
        C2
    }

    set map([list charge HEXP2])  {
        0.0
        0.0
        0.0
    }

    set map([list mass HEXP2])    {
        59.04
        28.05
        29.06
    }

    set map([list weights HEXP2]) {
        {1.0 1.0 1.0 1.0 1.0 1.0 1.0}
        {1.0 1.0 1.0 1.0 1.0 1.0}
        {1.0 1.0 1.0 1.0 1.0 1.0 1.0}
    }

    set map([list bonds HEXP2]) {
        {O2 C1}
        {C1 C2}
    }

    set map([list angles HEXP2]) {
        {O2 C1 C2}
    }

    set map([list dihedrals HEXP2]) {
        {none}
    }

    ## Neutral Heptanoic Acid (FFA headgroup)
    ## https://en.wikipedia.org/wiki/Heptanoic_acid

    set map([list map HEPP2]) {
        {C1 O1 O2 H C2 H21 H22}
        {C3 H31 H32 C4 H41 H42 C5 H51 H52}
        {C6 H61 H62 C7 H71 H72 H73}
    }

    set map([list type HEPP2])    {
        COOH
        CM
        CT2
    }

    set map([list name HEPP2])    {
        O2
        C1
        C2
    }

    set map([list charge HEPP2])  {
        0.0
        0.0
        0.0
    }

    set map([list mass HEPP2])    {
        59.04
        42.08
        29.06
    }

    set map([list weights HEPP2]) {
        {1.0 1.0 1.0 1.0 1.0 1.0 1.0}
        {1.0 1.0 1.0 1.0 1.0 1.0 1.0 1.0 1.0 1.0}
        {1.0 1.0 1.0 1.0 1.0 1.0 1.0}
    }

    set map([list bonds HEPP2]) {
        {O2 C1}
        {C1 C2}
    }

    set map([list angles HEPP2]) {
        {O2 C1 C2}
    }

    set map([list dihedrals HEPP2]) {
        {none}
    }

    ## Neutral Octanoic (Caprylic) Acid (FFA headgroup)
    ## https://en.wikipedia.org/wiki/Heptanoic_acid

    set map([list map OCTP2]) {
        {C1 O1 O2 H C2 H21 H22}
        {C3 H31 H32 C4 H41 H42 C5 H51 H52}
        {C6 H61 H62 C7 H71 H72 C8 H81 H82 H83}
    }

    set map([list type OCTP2])    {
        COOH
        CM
        CT
    }

    set map([list name OCTP2])    {
        O2
        C1
        C2
    }

    set map([list charge OCTP2])  {
        0.0
        0.0
        0.0
    }

    set map([list mass OCTP2])    {
        59.04
        42.08
        43.09
    }

    set map([list weights OCTP2]) {
        {1.0 1.0 1.0 1.0 1.0 1.0 1.0}
        {1.0 1.0 1.0 1.0 1.0 1.0 1.0 1.0 1.0 1.0}
        {1.0 1.0 1.0 1.0 1.0 1.0 1.0 1.0 1.0 1.0}
    }

    set map([list bonds OCTP2]) {
        {O2 C1}
        {C1 C2}
    }

    set map([list angles OCTP2]) {
        {O2 C1 C2}
    }

    set map([list dihedrals OCTP2]) {
        {none}
    }

    ## Neutral Acetic Acid (FFA headgroup)
    ## Used for Headgroup Parameterization

    set map([list map ACEP2]) {
        {C1 O1 O2 H C2 H21 H22 H23}
    }

    set map([list type ACEP2])    {
        COOH
    }

    set map([list name ACEP2])    {
        O2
    }

    set map([list charge ACEP2])  {
        0.0
    }

    set map([list mass ACEP2])    {
        60.04
    }

    set map([list weights ACEP2]) {
        {1.0 1.0 1.0 1.0 1.0 1.0 1.0 1.0}
    }

    set map([list bonds ACEP2]) {
      {none}
    }

    set map([list angles ACEP2]) {
     {none}
    }

    set map([list dihedrals ACEP2]) {
        {none}
    }

    return
}

::CGtools::map_ffa

if { $::CGtools::maptest } {
    ::CGtools::map_stats {BENA BENP BTAP BTAP2
          ACEP2 PENP2 HEXP2 HEPP2 OCTP2}
}
