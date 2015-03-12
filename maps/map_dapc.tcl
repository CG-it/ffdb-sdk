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

## charge DAPC   | map DAPC                                                                               | mass DAPC | name DAPC | type DAPC |
## 0.1118033989  | N C11 H11A H11B C12 H12A H12B C13 H13A H13B H13C C14 H14A H14B H14C C15 H15A H15B H15C | 87.1647   | NC        | NC        |
## -0.1118033989 | P O11 O12 O13 O14                                                                      | 94.9716   | PH        | PH        |
## 0.0           | C1 HA HB C2 HS C3 HX HY                                                                | 41.0725   | GL        | GL        |
## 0.0           | O21 C21 O22 C22 H2R H2S                                                                | 58.0358   | EST1      | EST1      |
## 0.0           | C23 H3R H3S C24 H4R H4S C25 H5R H5S                                                    | 42.0804   | C11       | CM        |
## 0.0           | C26 H6R H6S C27 H7R H7S C28 H8R H8S                                                    | 42.0804   | C12       | CM        |
## 0.0           | C29 H9R H9S C210 H10R H10S C211 H11R H11S                                              | 42.0804   | C13       | CM        |
## 0.0           | C212 H12R H12S C213 H13R H13S C214 H14R H14S                                           | 42.0804   | C14       | CM        |
## 0.0           | C215 H15R H15S C216 H16R H16S C217 H17R H17S                                           | 42.0804   | C15       | CM        |
## 0.0           | C218 J18R H18S C219 H19R H19S C220 H20R H20S H20T                                      | 43.0877   | C16       | CT        |
## 0.0           | O31 C31 O32 C32 H2X H2Y                                                                | 58.0358   | EST2      | EST2      |
## 0.0           | C33 H3X H3Y C34 H4X H4Y C35 H5X H5Y                                                    | 42.0804   | C21       | CM        |
## 0.0           | C36 H6X H6Y C37 H7X H7Y C38 H8X H8Y                                                    | 42.0804   | C22       | CM        |
## 0.0           | C39 H9X H9Y C310 H10X H10Y C311 H11X H11Y                                              | 42.0804   | C23       | CM        |
## 0.0           | C312 H12X H12Y C313 H13X H13Y C314 H14X H14Y                                           | 42.0804   | C24       | CM        |
## 0.0           | C315 H15X H15Y C316 H16X H16Y C317 H17X H17Y                                           | 42.0804   | C25       | CM        |
## 0.0           | C318 J18X H18Y C319 H19X H19Y C320 H20X H20Y H20Z                                      | 43.0877   | C26       | CT        |

proc ::CGtools::map_dppc {} {

    variable map



    # +--------------+
    # |     DAPC     |
    # +--------------+

    set map([list type DAPC]) {
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

    set map([list name DAPC]) {
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

    set map([list map DAPC]) {
        {N C11 H11A H11B C12 H12A H12B C13 H13A H13B H13C C14 H14A H14B H14C C15 H15A H15B H15C}
        {P O11 O12 O13 O14}
        {C1 HA HB C2 HS C3 HX HY}
        {O21 C21 O22 C22 H2R H2S}
        {C23 H3R H3S C24 H4R H4S C25 H5R H5S}
        {C26 H6R H6S C27 H7R H7S C28 H8R H8S}
        {C29 H9R H9S C210 H10R H10S C211 H11R H11S}
        {C212 H12R H12S C213 H13R H13S C214 H14R H14S}
        {C215 H15R H15S C216 H16R H16S C217 H17R H17S}
        {C218 H18R H18S C219 H19R H19S C220 H20R H20S H20T}
        {O31 C31 O32 C32 H2X H2Y}
        {C33 H3X H3Y C34 H4X H4Y C35 H5X H5Y}
        {C36 H6X H6Y C37 H7X H7Y C38 H8X H8Y}
        {C39 H9X H9Y C310 H10X H10Y C311 H11X H11Y}
        {C312 H12X H12Y C313 H13X H13Y C314 H14X H14Y}
        {C315 H15X H15Y C316 H16X H16Y C317 H17X H17Y}
        {C318 H18X H18Y C319 H19X H19Y C320 H20X H20Y H20Z}
    }

    set map([list charge DAPC]) {
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

    set map([list mass DAPC]) {
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

    set map([list bonds DAPC]) {
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

    set map([list angles DAPC]) {
        {auto}
    }

    set map([list dihedrals DAPC]) {
        {none}
    }


    set map([list atomicnumber DAPC]) {
    }

    return
}

::CGtools::map_dppc

if { $::CGtools::maptest } {
    ::CGtools::map_stats DAPC
    ::CGtools::checkbonds DAPC
}
