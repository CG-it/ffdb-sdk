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

# ======DSPC =========
#    charge DSPC    17
#       map DSPC    17
#      mass DSPC    17
#      name DSPC    17
#      type DSPC    17
#
#charge DSPC   | map DSPC                                                                               | mass DSPC | name DSPC | type DSPC |
#+0.1118033989 | N C11 H11A H11B C12 H12A H12B C13 H13A H13B H13C C14 H14A H14B H14C C15 H15A H15B H15C | 87.1647   | NC        | NC        |
#-0.1118033989 | P O11 O12 O13 O14                                                                      | 94.9716   | PH        | PH        |
#0.0           | C1 HA HB C2 HS C3 HX HY                                                                | 41.0725   | GL        | GL        |
#0.0           | O21 C21 O22 C22 H2R H2S                                                                | 58.0358   | EST1      | EST1      |
#0.0           | C23 H3R H3S C24 H4R H4S C25 H5R H5S                                                    | 42.0804   | C11       | CM        |
#0.0           | C26 H6R H6S C27 H7R H7S C28 H8R H8S                                                    | 42.0804   | C12       | CM        |
#0.0           | C29 H9R H9S C210 H10R H10S C211 H11R H11S                                              | 42.0804   | C13       | CM        |
#0.0           | C212 H12R H12S C213 H13R H13S C214 H14R H14S                                           | 42.0804   | C14       | CM        |
#0.0           | C215 H15R H15S C216 H16R H16S                                                          | 28.0537   | C15       | CM2       |
#0.0           | C217 H17R H17S C218 H18R H18S H18T                                                     | 29.0615   | C16       | CT2       |
#0.0           | O31 C31 O32 C32 H2X H2Y                                                                | 58.0358   | EST2      | EST2      |
#0.0           | C33 H3X H3Y C34 H4X H4Y C35 H5X H5Y                                                    | 42.0804   | C21       | CM        |
#0.0           | C36 H6X H6Y C37 H7X H7Y C38 H8X H8Y                                                    | 42.0804   | C22       | CM        |
#0.0           | C39 H9X H9Y C310 H10X H10Y C311 H11X H11Y                                              | 42.0804   | C23       | CM        |
#0.0           | C312 H12X H12Y C313 H13X H13Y C314 H14X H14Y                                           | 42.0804   | C24       | CM        |
#0.0           | C315 H15X H15Y C316 H16X H16Y                                                          | 28.0537   | C25       | CM2       |
#0.0           | C317 H17X H17Y C318 H18X H18Y H18Z                                                     | 29.0615   | C26       | CT2       |
#
#checkbonds: DSPC OK
#checkangles: DSPC auto


proc ::CGtools::map_dspc {} {

    variable map

    # +--------------+
    # |     DSPC     |
    # +--------------+

    set map([list type DSPC]) {
        NC
        PH
        GL
        EST1
        CM
        CM
        CM
        CM
        CM2
        CT2
        EST2
        CM
        CM
        CM
        CM
        CM2
        CT2
    }

    set map([list name DSPC]) {
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
        EST2
        C21
        C22
        C23
        C24
        C25
        C26
    }

    set map([list map DSPC]) {
        {N C11 H11A H11B C12 H12A H12B C13 H13A H13B H13C C14 H14A H14B H14C C15 H15A H15B H15C}
        {P O11 O12 O13 O14}
        {C1 HA HB C2 HS C3 HX HY}
        {O21 C21 O22 C22 H2R H2S}
        {C23 H3R H3S C24 H4R H4S C25 H5R H5S}
        {C26 H6R H6S C27 H7R H7S C28 H8R H8S}
        {C29 H9R H9S C210 H10R H10S C211 H11R H11S}
        {C212 H12R H12S C213 H13R H13S C214 H14R H14S}
        {C215 H15R H15S C216 H16R H16S}
        {C217 H17R H17S C218 H18R H18S H18T}
        {O31 C31 O32 C32 H2X H2Y}
        {C33 H3X H3Y C34 H4X H4Y C35 H5X H5Y}
        {C36 H6X H6Y C37 H7X H7Y C38 H8X H8Y}
        {C39 H9X H9Y C310 H10X H10Y C311 H11X H11Y}
        {C312 H12X H12Y C313 H13X H13Y C314 H14X H14Y}
        {C315 H15X H15Y C316 H16X H16Y}
        {C317 H17X H17Y C318 H18X H18Y H18Z}
    }

    set map([list charge DSPC]) {
        +0.1118033989
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

    set map([list mass DSPC]) {
        87.1647
        94.9716
        41.0725
        58.0358
        42.0804
        42.0804
        42.0804
        42.0804
        28.0537
        29.0615
        58.0358
        42.0804
        42.0804
        42.0804
        42.0804
        28.0537
        29.0615
    }

    set map([list bonds DSPC]) {
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

    set map([list angles DSPC]) {
        {auto}
    }

    set map([list atomicnumber DSPC]) {
        50
        47
        23
        30
        24
        24
        24
        24
        16
        17
        30
        24
        24
        24
        24
        16
        17
    }

    return
}

## Load the map into the map array
::CGtools::map_dspc

## Run tests if requested
if { $::CGtools::maptest } {
    ::CGtools::map_stats   DSPC
    ::CGtools::checkbonds  DSPC
    ::CGtools::checkangles DSPC
}
