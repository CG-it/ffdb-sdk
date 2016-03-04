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
        source common.tcl ;# Testing functions for consistency
    }
}

proc ::CGtools::map_dgpc {} {

    variable map



    # +--------------+
    # |     DGPC     |
    # +--------------+

    set map([list type DGPC]) {
        NC
        PH
        GL
        EST1
        CM
        CM
        CM
        CM
        CM
        CT
        EST2
        CM
        CM
        CM
        CM
        CM
        CT
    }

    set map([list name DGPC]) {
        NC
        PH
        GL
        EST1
        C11
        C12
        C13
        C14
        C15
        C16
        C17
        EST2
        C21
        C22
        C23
        C24
        C25
        C26
        C27
    }

    set map([list map DGPC]) {
        {N C11 H11A H11B C12 H12A H12B C13 H13A H13B H13C C14 H14A H14B H14C C15 H15A H15B H15C}
        {P O11 O12 O13 O14}
        {C1 HA HB C2 HS C3 HX HY}
        {O21 C21 O22 C22 H2R H2S}
        {C23 H3R H3S C24 H4R H4S C25 H5R H5S}
        {C26 H6R H6S C27 H7R H7S C28 H8R H8S}
        {C29 H9R H9S C210 H10R H10S}
        {C211 H11R H11S C212 H12R}
        {C213 H13R H13S C214 H14R H14S C215 H15R H15S}
        {C216 H16R H16S C217 H17R H17S C218 H18R H18S}
        {C219 H19R H19S C220 H20R H20S H20T}
        {O31 C31 O32 C32 H2X H2Y}
        {C33 H3X H3Y C34 H4X H4Y C35 H5X H5Y}
        {C36 H6X H6Y C37 H7X H7Y C38 H8X H8Y}
        {C39 H9X H9Y C310 H10X H10Y}
        {C311 H11X C312 H12X}
        {C313 H13X H13Y C314 H14X H14Y C315 H15X H15Y}
        {C316 H16X H16Y C317 H17X H17Y C318 H18X H18Y}
        {C319 H19X H19Y C320 H20X H20Y H20Z}
    }

    set map([list charge DGPC]) {
        0.1118033989
        -0.1118033989
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
        0.0
        0.0
        0.0
        0.0
    }

    set map([list mass DGPC]) {
        87.1647
        94.9716
        41.0725
        58.0358
        42.0804
        42.0804
        42.0804
        42.0804
        42.0804
        43.0877
        58.0358
        42.0804
        42.0804
        42.0804
        42.0804
        42.0804
        43.0877
    }

    set map([list bonds DGPC]) {
        {NC PH}
        {PH GL}
        {GL EST1}
        {EST1 C11}
        {C11 C12}
        {C12 C13}
        {C13 C14}
        {C14 C15}
        {C15 C16}
        {GL EST2}
        {EST2 C21}
        {C21 C22}
        {C22 C23}
        {C23 C24}
        {C24 C25}
        {C25 C26}
    }

    set map([list angles DGPC]) {
        {auto}
    }

    set map([list dihedrals DGPC]) {
        {none}
    }


    set map([list atomicnumber DGPC]) {
    }

    return
}

::CGtools::map_dgpc

if { $::CGtools::maptest } {
    ::CGtools::map_stats DGPC
    ::CGtools::checkbonds DGPC
}
