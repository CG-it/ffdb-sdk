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

#Loading CG mappings from map_hydrocarbon.tcl
#========= HEPT =========
#    charge HEPT     3
#      mass HEPT     3
#      name HEPT     3
#   map HEPT     3
#      type HEPT     3
#
#charge HEPT | mass HEPT | name HEPT | map HEPT                     | type HEPT |
#0.0         | 29.062    | C1        | C1 H11 H12 H13 C2 H21 H22        | CT2       |
#0.0         | 42.081    | C2        | C3 H31 H32 C4 H41 H42 C5 H51 H52 | CM        |
#0.0         | 29.062    | C3        | C6 H61 H62 C7 H71 H72 H73        | CT2       |
#
#checkbonds: HEPT OK
#========= OCT =========
#     charge OCT     3
#       mass OCT     3
#       name OCT     3
#    map OCT     3
#       type OCT     3
#
#charge OCT | mass OCT | name OCT | map OCT                          | type OCT |
#0.0        | 43.088   | C1       | C1 H11 H12 H13 C2 H21 H22 C3 H31 H32 | CT       |
#0.0        | 28.054   | C2       | C4 H41 H42 C5 H51 H52                | CM2      |
#0.0        | 43.088   | C3       | C6 H61 H62 C7 H71 H72 C8 H81 H82 H83 | CT       |
#
#checkbonds: OCT OK

#========= 4COC =========
#    charge 4COC     3
#      mass 4COC     3
#      name 4COC     3
#   map 4COC     3
#      type 4COC     3
#
#charge 4COC | mass 4COC | name 4COC | map 4COC                         | type 4COC |
#0.0         | 43.0890   | C1        | C1 H1R H1S H1T C2 H2R H2S C3 H3R H3S | CT        |
#0.0         | 40.0650   | C2        | C4 H4R C5 H5R C6 H6R H6S             | CMD3      |
#0.0         | 29.0620   | C3        | C7 H7R H7S C8 H8R H8S H8T            | CT2       |
#
#checkbonds: 4COC OK


proc ::CGtools::map_hydrocarbon {} {

    variable map



    # +-------------+
    # |  HEPTANE    |
    # +-------------+

    set map([list map HEPT]) {
        {C1 H11 H12 H13 C2 H21 H22}
        {C3 H31 H32 C4 H41 H42 C5 H51 H52}
        {C6 H61 H62 C7 H71 H72 H73}
    }

    set map([list type HEPT])    {
        CT2
        CM
        CT2
    }

    set map([list name HEPT])    {
        C1
        C2
        C3
    }

    set map([list charge HEPT])  {
        0.0
        0.0
        0.0
    }

    set map([list mass HEPT])    {
        29.062
        42.081
        29.062
    }

    set map([list bonds HEPT]) {
        {C1 C2}
        {C2 C3}
    }

    set map([list angles HEPT]) {
        {auto}
    }

    # alternative mapping of heptane
    set map([list map HEPB]) {
        {C1 H11 H12 H13 C2 H21 H22}
        {C3 H31 H32 C4 H41 H42}
        {C5 H51 H52 C6 H61 H62 C7 H71 H72 H73}
    }

    set map([list type HEPB])    {
        CT2
        CM2
        CT
    }

    set map([list name HEPB])    {
        C1
        C2
        C3
    }

    set map([list charge HEPB])  {
        0.0
        0.0
        0.0
    }

    set map([list mass HEPB])    {
        29.062
        28.054
        43.088
    }

    set map([list bonds HEPB]) {
        {C1 C2}
        {C2 C3}
    }

    set map([list angles HEPB]) {
        {auto}
    }



    # isohexane (2-methylpentane)
    set map([list map IHEX]) {
        {C1 H11 H12 H13 C2 H21 C3 H31 H32 H33}
        {C4 H41 H42 C5 H51 H52 C6 H61 H62 H63}
    }

    set map([list type IHEX])    {
        C2T
        CT
    }

    set map([list name IHEX])    {
        C1
        C2
    }

    set map([list charge IHEX])  {
        0.0
        0.0
    }

    set map([list mass IHEX])    {
        43.0890
        43.0890
    }

    set map([list bonds IHEX]) {
        {C1 C2}
    }

    # isopentane (2-methylbutane)
    set map([list map IPEN]) {
        {C1 H11 H12 H13 C2 H21 C3 H31 H32 H33}
        {C4 H41 H42 C5 H51 H52 H53}
    }

    set map([list type IPEN])    {
        C2T
        CT2
    }

    set map([list name IPEN])    {
        C1
        C2
    }

    set map([list charge IPEN])  {
        0.0
        0.0
    }

    set map([list mass IPEN])    {
        43.0877
        29.0611
    }

    set map([list bonds IPEN]) {
        {C1 C2}
    }


    # octane
    set map([list map OCT]) {
        {C1 H11 H12 H13 C2 H21 H22 C3 H31 H32}
        {C4 H41 H42 C5 H51 H52}
        {C6 H61 H62 C7 H71 H72 C8 H81 H82 H83}
    }

    set map([list type OCT])    {
        CT
        CM2
        CT
    }

    set map([list name OCT])    {
        C1
        C2
        C3
    }

    set map([list charge OCT])  {
        0.0
        0.0
        0.0
    }

    set map([list mass OCT])    {
        43.088
        28.054
        43.088
    }

    set map([list bonds OCT]) {
        {C1 C2}
        {C2 C3}
    }

    set map([list angles OCT]) {
        {auto}
    }

    # octane - Alternative mapping with larger center bead
    set map([list map OCTA]) {
        {C1 H11 H12 H13 C2 H21 H22}
        {C3 H31 H32 C4 H41 H42 C5 H51 H52 C6 H61 H62}
        {C7 H71 H72 C8 H81 H82 H83}
    }

    set map([list type OCTA])    {
        CT2
        CM4
        CT2
    }

    set map([list name OCTA])    {
        C1
        C2
        C3
    }

    set map([list charge OCTA])  {
        0.0
        0.0
        0.0
    }

    set map([list mass OCTA])    {
        29.0620
        56.1080
        29.0620
    }

    set map([list bonds OCTA]) {
        {C1 C2}
        {C2 C3}
    }

    set map([list angles OCTA]) {
        {auto}
    }

    # octane - Alternative mapping with smaller center bead
    # This is the same as OCT.
    set map([list map OCTB]) {
        {C1 H11 H12 H13 C2 H21 H22 C3 H31 H32}
        {C4 H41 H42 C5 H51 H52}
        {C6 H61 H62 C7 H71 H72 C8 H81 H82 H83}
    }

    set map([list type OCTB])    {
        CT
        CM2
        CT
    }

    set map([list name OCTB])    {
        C1
        C2
        C3
    }

    set map([list charge OCTB])  {
        0.0
        0.0
        0.0
    }

    set map([list mass OCTB])    {
        43.0890
        28.0540
        43.0890
    }

    set map([list bonds OCTB]) {
        {C1 C2}
        {C2 C3}
    }

    set map([list angles OCTB]) {
        {C1 C2 C3}
    }


    # octane - Alternative mapping with 2 smaller center beads
    set map([list map OCTC]) {
        {C1 H11 H12 H13 C2 H21 H22}
        {C3 H31 H32 C4 H41 H42}
        {C5 H51 H52 C6 H61 H62}
        {C7 H71 H72 C8 H81 H82 H83}
    }

    set map([list type OCTC])    {
        CT2
        CM2
        CM2
        CT2
    }

    set map([list name OCTC])    {
        C1
        C2
        C3
        C4
    }

    set map([list charge OCTC])  {
        0.0
        0.0
        0.0
        0.0
    }

    set map([list mass OCTC])    {
        29.0620
        28.0540
        28.0540
        29.0620
    }

    set map([list bonds OCTC]) {
        {C1 C2}
        {C2 C3}
        {C3 C4}
    }

    set map([list angles OCTC]) {
        {C1 C2 C3}
        {C2 C3 C4}
    }

    # bicyclooctane
    set map([list map BCO]) {
        {C1 H11 H12 C2 H21     C6 H61 H62}
        {C3 H31 H32 C4 H41 H42 C5 H51}
        {C7 H71 H72 C8 H81 H82}
    }

    set map([list type BCO])    {
        CMR
        CMR
        CM2R
    }

    set map([list name BCO])    {
        C1
        C2
        C3
    }

    set map([list charge BCO])  {
        0.0
        0.0
        0.0
    }

    set map([list mass BCO])    {
        41.0718
        41.0718
        28.0532
    }

    set map([list bonds BCO]) {
        {C1 C2}
        {C2 C3}
        {C3 C1}
    }

    set map([list angles BCO]) {
        {auto}
    }

    # bicyclooctane (alternative map)
    set map([list map BCOB]) {
        {C1 H11 H12 C2 H21 C3 H31 H32 }
        {C4 H41 H42 C5 H51 C6 H61 H62}
        {C7 H71 H72 C8 H81 H82}
    }

    set map([list type BCOB])    {
        CMB
        CMB
        CM2R
    }

    set map([list name BCOB])    {
        C1
        C2
        C3
    }

    set map([list charge BCOB])  {
        0.0
        0.0
        0.0
    }

    set map([list mass BCOB])    {
        41.0718
        41.0718
        28.0532
    }

    set map([list bonds BCOB]) {
        {C1 C2}
        {C2 C3}
        {C3 C1}
    }

    set map([list angles BCOB]) {
        {auto}
    }


    # decalin
    set map([list map DECN]) {
        {C2 H21 H22 C1 H11 C10 H101 H102}
        {C3 H31 H32 C4 H41 H42}
        {C5 H51 H52 C6 H61 C7 H71 H72}
        {C8 H81 H82 C9 H91 H92}
    }

    set map([list type DECN])    {
        CMB
        CM2R
        CMB
        CM2R
    }

    set map([list name DECN])    {
        C1
        C2
        C3
        C4
    }

    set map([list charge DECN])  {
        0.0
        0.0
        0.0
        0.0
    }

    set map([list mass DECN])    {
        41.073
        28.054
        41.073
        28.054
    }

    set map([list bonds DECN]) {
        {C1 C2}
        {C2 C3}
        {C3 C1}
        {C3 C4}
        {C4 C1}
    }

    set map([list angles DECN]) {
        {auto}
    }

    # decalin (alternative map)
    set map([list map DECB]) {
        {C1 H11 C2 H21 H22 C3 H31 H32}
        {C4 H41 H42 C5 H51 H52 C6 H61 }
        {C6 H61 C7 H71 H72 C8 H81 H82}
        {C9 H91 H92 C10 H101 H102 C1 H11}
    }

    set map([list type DECB])    {
        CMR
        CMR
        CMR
        CMR
    }

    set map([list name DECB])    {
        C1
        C2
        C3
        C4
    }

    set map([list charge DECB])  {
        0.0
        0.0
        0.0
        0.0
    }

    set map([list mass DECB])    {
        34.5635
        34.5635
        34.5635
        34.5635
    }

    set map([list bonds DECB]) {
        {C1 C2}
        {C2 C3}
        {C3 C4}
        {C4 C1}
    }

    set map([list angles DECB]) {
        {auto}
    }


    # cyclohexane
    set map([list map CHEX]) {
        {C1 H1A H1B C2 H2A H2B}
        {C3 H3A H3B C4 H4A H4B}
        {C5 H5A H5B C6 H6A H6B}
    }

    #set map([list map CHEX]) {
    #    {C1 H11 H12 C2 H21 H22}
    #    {C3 H31 H32 C4 H41 H42}
    #    {C5 H51 H52 C6 H61 H62}
    #}


    set map([list name CHEX]) {
        C1
        C2
        C3
    }

    set map([list type CHEX]) {
        CM2R
        CM2R
        CM2R
    }

    set map([list charge CHEX])  {
        0.0
        0.0
        0.0
    }

    set map([list mass CHEX])    {
        28.054
        28.054
        28.054
    }

    set map([list bonds CHEX]) {
        {C1 C2}
        {C2 C3}
        {C3 C1}
    }

    set map([list angles CHEX]) {
        {auto}
    }


    ## 4-cis-octene
    set map([list map 4COC]) {
        {C1 H1R H1S H1T C2 H2R H2S C3 H3R H3S}
        {C4 H4R C5 H5R C6 H6R H6S}
        {C7 H7R H7S C8 H8R H8S H8T}
    }

    set map([list type 4COC])    {
        CT
        CMD3
        CT2
    }

    set map([list name 4COC])    {
        C1
        C2
        C3
    }

    set map([list charge 4COC])  {
        0.0
        0.0
        0.0
    }

    set map([list mass 4COC])    {
        {43.0890}
        {40.0650}
        {29.0620}
    }

    set map([list bonds 4COC]) {
        {C1 C2}
        {C2 C3}
    }

    set map([list angles 4COC]) {
        {auto}
    }


    ## 1-ethyl-cyclohexene
    set map([list map ECHE]) {
        {CA CB HB1 CC HC1 HC2}
        {CD HD1 HD2 CE HE1 HE2 CF HF1 HF2}
        {C1 H11 H12 C2 H21 H22 H23}
    }

    set map([list type ECHE])    {
        CMDB
        CMR
        CT2
    }

    set map([list name ECHE])    {
        C1
        C2
        C3
    }

    set map([list charge ECHE])  {
        0.0
        0.0
        0.0
    }

    set map([list mass ECHE])    {
        {39.0570}
        {42.0810}
        {29.0620}
    }

    set map([list bonds ECHE]) {
        {C1 C2}
        {C3 C1}
    }

    set map([list angles ECHE]) {
        {auto}
    }

    ## 1-propyl-1-cyclohexene
    set map([list map PCHE]) {
        {CA CB HB1 CC HC1 HC2}
        {CD HD1 HD2 CE HE1 HE2 CF HF1 HF2}
        {C1 H11 H12 C2 H21 H22 C3 H31 H32 H33}
    }

    set map([list type PCHE])    {
        CMDB
        CMR
        CT
    }

    set map([list name PCHE])    {
        C1
        C2
        C3
    }

    set map([list charge PCHE])  {
        0.0
        0.0
        0.0
    }

    set map([list mass PCHE])    {
        {39.0570}
        {42.0810}
        {43.0890}
    }

    set map([list bonds PCHE]) {
        {C1 C2}
        {C3 C1}
    }

    set map([list angles PCHE]) {
        {auto}
    }


    ## 2-methyl-heptane
    set map([list map 2MHE]) {
        {C1 H11 H12 H13 C2 H21 H22}
        {C3 H31 H32 C4 H41 H42 C5 H51 H52}
        {CT HT C6 H61 H62 H63 C7 H71 H72 H73}
    }

    set map([list type 2MHE])    {
        CT2
        CM
        C2T
    }

    set map([list name 2MHE])    {
        C1
        C2
        C3
    }

    set map([list charge 2MHE])  {
        0.0
        0.0
        0.0
    }

    set map([list mass 2MHE])    {
        { 29.0620}
        { 42.0810}
        { 43.0890}
    }

    set map([list bonds 2MHE]) {
        {C1 C2}
        {C2 C3}
    }

    set map([list angles 2MHE]) {
        {C1 C2 C3}
    }

    set map([list dihedrals 2MHE]) {
        {none}
    }

    ## Dodecane C12, CT2-CM-CM2-CM-CT2
    set map([list map DODC]) {
        {C1 H11 H12 H13 C2 H21 H22}
        {C3 H31 H32 C4 H41 H42 C5 H51 H52}
        {C6 H61 H62 C7 H71 H72}
        {C8 H81 H82 C9 H91 H92 C10 H101 H102}
        {C11 H111 H112 C12 H121 H122 H123}
    }

    set map([list type DODC])    {
        CT2
        CM
        CM2
        CM
        CT2
    }

    set map([list name DODC])    {
        C1
        C2
        C3
        C4
        C5
    }

    set map([list charge DODC])  {
        0.0
        0.0
        0.0
        0.0
        0.0
    }

    set map([list mass DODC])    {
        { 29.0620}
        { 42.0810}
        { 28.0540}
        { 42.0810}
        { 29.0620}
    }

    set map([list bonds DODC]) {
        {C1 C2}
        {C2 C3}
        {C3 C4}
        {C4 C5}
    }

    set map([list angles DODC]) {
        {C1 C2 C3}
        {C2 C3 C4}
        {C3 C4 C5}
    }

    set map([list dihedrals DODC]) {
        {auto}
    }

    ## Dodecane C12, CT-CM-CM2-CM2-CT2
    ## Alternative Mapping
    set map([list map DODC2]) {
        {C1 H11 H12 H13 C2 H21 H22 C3 H31 H32}
        {C4 H41 H42 C5 H51 H52 C6 H61 H62}
        {C7 H71 H72 C8 H81 H82}
        {C9 H91 H92 C10 H101 H102}
        {C11 H111 H112 C12 H121 H122 H123}
    }

    set map([list type DODC2])    {
        CT
        CM
        CM2
        CM2
        CT2
    }

    set map([list name DODC2])    {
        C1
        C2
        C3
        C4
        C5
    }

    set map([list charge DODC2])  {
        0.0
        0.0
        0.0
        0.0
        0.0
    }

    set map([list mass DODC2])    {
        { 43.0890}
        { 42.0810}
        { 28.0540}
        { 28.0540}
        { 29.0620}
    }

    set map([list bonds DODC2]) {
        {C1 C2}
        {C2 C3}
        {C3 C4}
        {C4 C5}
    }

    set map([list angles DODC2]) {
        {C1 C2 C3}
        {C2 C3 C4}
        {C3 C4 C5}
    }

    set map([list dihedrals DODC2]) {
        {auto}
    }


    return
}

::CGtools::map_hydrocarbon

if { $::CGtools::maptest } {
    ::CGtools::map_stats HEPT
    ::CGtools::checkbonds HEPT
    ::CGtools::map_stats OCT
    ::CGtools::checkbonds OCT
    ::CGtools::map_stats DECN
    ::CGtools::checkbonds DECN
    ::CGtools::map_stats 4COC
    ::CGtools::checkbonds 4COC
    ::CGtools::map_stats PCHE
    ::CGtools::checkbonds PCHE
    ::CGtools::map_stats 2MHE
    ::CGtools::checkbonds 2MHE
    ::CGtools::map_stats DODC
    ::CGtools::checkbonds DODC
    ::CGtools::map_stats DODC2
    ::CGtools::checkbonds DODC2

}
