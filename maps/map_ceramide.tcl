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

#========= CER1 =========
#    charge CER1    27
#       map CER1    27
#      mass CER1    27
#      name CER1    27
#      type CER1    27
#
#charge CER1 | map CER1                                     | mass CER1 | name CER1 | type CER1 |
#0.0         | O1 HO1 C1 HA HB                              | 31.0344   | OH1       | SER       |
#0.0         | C2 HS N21 HN                                 | 28.0340   | N         | N         |
#0.0         | C3 HX O3 HO                                  | 30.0264   | OH2       | SER       |
#0.0         | C34 H4X C35 H5X                              | 26.0380   | CS3       | CMD2      |
#0.0         | C36 H6X H6Y H14S C37 H7X H7Y C38 H8X H8Y     | 43.0890   | CS4       | CM        |
#0.0         | C39 H9X H9Y C310 H10X H10Y C311 H11X H11Y    | 42.0810   | CS5       | CM        |
#0.0         | C312 H12X H12Y C313 H13X H13Y C314 H14X H14Y | 42.0810   | CS6       | CM        |
#0.0         | C315 H15X H15Y C316 H16X H16Y                | 28.0540   | CS7       | CM2       |
#0.0         | C317 H17X H17Y C318 H18X H18Y H18Z           | 29.0620   | CS8       | CT2       |
#0.0         | C21 O22                                      | 28.0100   | OA1       | O         |
#0.0         | C22 H2R H2S C23 H3R H3S C24 H4R H4S          | 42.0810   | CA2       | CM        |
#0.0         | C25 H5R H5S C26 H6R H6S C27 H7R H7S          | 42.0810   | CA3       | CM        |
#0.0         | C28 H8R H8S C29 H9R H9S C210 H10R H10S       | 42.0810   | CA4       | CM        |
#0.0         | C211 H11R H11S C212 H12R H12S C213 H13R H13S | 42.0810   | CA5       | CM        |
#0.0         | C214 H14R C215 H15R H15S C216 H16R H16S      | 41.0730   | CA6       | CM        |
#0.0         | C217 H17R H17S C218 H18R H18S C219 H19R H19S | 42.0810   | CA7       | CM        |
#0.0         | C220 H20R H20S C221 H21R H21S C222 H22R H22S | 42.0810   | CA8       | CM        |
#0.0         | C223 H23R H23S C224 H24R H24S C225 H25R H25S | 42.0810   | CA9       | CM        |
#0.0         | C226 H26R H26S C227 H27R H27S C228 H28R H28S | 42.0810   | CA10      | CM        |
#0.0         | C229 H29R H29S C230 H30R H30S                | 28.0540   | CA11      | CM2       |
#0.0         | C232 H32R H32S C231 OM O                     | 58.0368   | OA12      | EST1      |
#0.0         | C233 H33R H33S C234 H34R H34S C235 H35R H35S | 42.0810   | CA13      | CM        |
#0.0         | C236 H36R H36S C237 H37R H37S C238 H38R H38S | 42.0810   | CA14      | CM        |
#0.0         | C239 H39R C240 H40R C241 H41R H41S           | 40.0650   | CA15      | CMD3      |
#0.0         | C242 H42R C243 H43R                          | 26.0380   | CA16      | CMD2      |
#0.0         | C244 H44R H44S C245 H45R H45S C246 H46R H46S | 42.0810   | CA17      | CM        |
#0.0         | C247 H47R H47S C248 H48R H48S H48T           | 29.0620   | CA18      | CT2       |
#
#========= CER2 =========
#    charge CER2    18
#       map CER2    18
#      mass CER2    18
#      name CER2    18
#      type CER2    18
#
#charge CER2 | map CER2                                     | mass CER2 | name CER2 | type CER2 |
#0.0         | O1 HO1 C1 HA HB                              | 31.0344   | OH1       | SER       |
#0.0         | C2 HS N21 HN                                 | 28.0340   | N         | N         |
#0.0         | C3 HX O3 HO                                  | 30.0264   | OH2       | SER       |
#0.0         | C34 H4X C35 H5X                              | 26.0380   | CS3       | CMD2      |
#0.0         | C36 H6X H6Y C37 H7X H7Y C38 H8X H8Y          | 42.0810   | CS4       | CM        |
#0.0         | C39 H9X H9Y C310 H10X H10Y C311 H11X H11Y    | 42.0810   | CS5       | CM        |
#0.0         | C312 H12X H12Y C313 H13X H13Y C314 H14X H14Y | 42.0810   | CS6       | CM        |
#0.0         | C315 H15X H15Y C316 H16X H16Y                | 28.0540   | CS7       | CM2       |
#0.0         | C317 H17X H17Y C318 H18X H18Y H18Z           | 29.0620   | CS8       | CT2       |
#0.0         | C21 O22                                      | 28.0100   | OA1       | O         |
#0.0         | C22 H2R H2S C23 H3R H3S C24 H4R H4S          | 42.0810   | CA2       | CM        |
#0.0         | C25 H5R H5S C26 H6R H6S C27 H7R H7S          | 42.0810   | CA3       | CM        |
#0.0         | C28 H8R H8S C29 H9R H9S C210 H10R H10S       | 42.0810   | CA4       | CM        |
#0.0         | C211 H11R H11S C212 H12R H12S C213 H13R H13S | 42.0810   | CA5       | CM        |
#0.0         | C214 H14R H14S C215 H15R H15S C216 H16R H16S | 42.0810   | CA6       | CM        |
#0.0         | C217 H17R H17S C218 H18R H18S C219 H19R H19S | 42.0810   | CA7       | CM        |
#0.0         | C220 H20R H20S C221 H21R H21S C222 H22R H22S | 42.0810   | CA8       | CM        |
#0.0         | C223 H23R H23S C224 H24R H24S H24T           | 29.0620   | CA9       | CT2       |

proc ::CGtools::map_ceramide {} {

    variable map

    

    # +------+
    # | CER1 |
    # +------+

    set map([list map CER1]) {
        {O1 HO1 C1 HA HB}
        {C2 HS N21 HN}
        {C3 HX O3 HO}
        {C34 H4X C35 H5X}
        {C36 H6X H6Y H14S C37 H7X H7Y C38 H8X H8Y}
        {C39 H9X H9Y C310 H10X H10Y C311 H11X H11Y}
        {C312 H12X H12Y C313 H13X H13Y C314 H14X H14Y}
        {C315 H15X H15Y C316 H16X H16Y}
        {C317 H17X H17Y C318 H18X H18Y H18Z}
        {C21 O22}
        {C22 H2R H2S C23 H3R H3S C24 H4R H4S}
        {C25 H5R H5S C26 H6R H6S C27 H7R H7S}
        {C28 H8R H8S C29 H9R H9S C210 H10R H10S}
        {C211 H11R H11S C212 H12R H12S C213 H13R H13S}
        {C214 H14R C215 H15R H15S C216 H16R H16S}
        {C217 H17R H17S C218 H18R H18S C219 H19R H19S}
        {C220 H20R H20S C221 H21R H21S C222 H22R H22S}
        {C223 H23R H23S C224 H24R H24S C225 H25R H25S}
        {C226 H26R H26S C227 H27R H27S C228 H28R H28S}
        {C229 H29R H29S C230 H30R H30S}
        {C232 H32R H32S C231 OM O}
        {C233 H33R H33S C234 H34R H34S C235 H35R H35S}
        {C236 H36R H36S C237 H37R H37S C238 H38R H38S}
        {C239 H39R C240 H40R C241 H41R H41S}
        {C242 H42R C243 H43R}
        {C244 H44R H44S C245 H45R H45S C246 H46R H46S}
        {C247 H47R H47S C248 H48R H48S H48T}
    }

    set map([list type CER1])    {
        SER 
        N
        SER
        CMD2
        CM
        CM
        CM
        CM2
        CT2
        O
        CM
        CM
        CM
        CM
        CM
        CM
        CM
        CM
        CM
        CM2
        EST1
        CM
        CM
        CMD3
        CMD2
        CM
        CT2
    }

    set map([list name CER1])    {
        OH1
        N
        OH2
        CS3
        CS4
        CS5
        CS6
        CS7
        CS8
        OA1
        CA2
        CA3
        CA4
        CA5
        CA6
        CA7
        CA8
        CA9
        CA10
        CA11
        OA12
        CA13
        CA14
        CA15
        CA16
        CA17
        CA18
    }

    set map([list charge CER1])  {
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

    set map([list mass CER1])    {
       31.0344
       28.0340
       30.0264
       26.0380
       43.0890
       42.0810
       42.0810
       28.0540
       29.0620
       28.0100
       42.0810
       42.0810
       42.0810
       42.0810
       41.0730
       42.0810
       42.0810
       42.0810
       42.0810
       28.0540
       58.0368
       42.0810
       42.0810
       40.0650
       26.0380
       42.0810
       29.0620
  }

    set map([list bonds CER1]) {
         {OH1 N} {OH2 N} {OH2 CS3}
         {CS3 CS4} {CS4 CS5} {CS5 CS6}
         {CS6 CS7} {CS7 CS8} {N OA1}
         {OA1 CA2} {CA2 CA3} {CA3 CA4} {CA4 CA5}
         {CA5 CA6} {CA6 CA7} {CA7 CA8}
         {CA8 CA9} {CA9 CA10} {CA10 CA11}
         {CA11 OA12} {OA12 CA13} {CA13 CA14}
         {CA14 CA15} {CA15 CA16} {CA16 CA17}
         {CA17 CA18}
    }

    set map([list angles CER1]) {
        {auto}
    }


    # +------+
    # | CER2 |
    # +------+

    set map([list map CER2]) {
      {O1 HO1 C1 HA HB}
      {C2 HS N21 HN}
      {C3 HX O3 HO}
      {C34 H4X C35 H5X}
      {C36 H6X H6Y C37 H7X H7Y C38 H8X H8Y}
      {C39 H9X H9Y C310 H10X H10Y C311 H11X H11Y}
      {C312 H12X H12Y C313 H13X H13Y C314 H14X H14Y}
      {C315 H15X H15Y C316 H16X H16Y}
      {C317 H17X H17Y C318 H18X H18Y H18Z}
      {C21 O22}
      {C22 H2R H2S C23 H3R H3S C24 H4R H4S}
      {C25 H5R H5S C26 H6R H6S C27 H7R H7S}
      {C28 H8R H8S C29 H9R H9S C210 H10R H10S}
      {C211 H11R H11S C212 H12R H12S C213 H13R H13S}
      {C214 H14R H14S C215 H15R H15S C216 H16R H16S}
      {C217 H17R H17S C218 H18R H18S C219 H19R H19S}
      {C220 H20R H20S C221 H21R H21S C222 H22R H22S}
      {C223 H23R H23S C224 H24R H24S H24T}
    }

    set map([list type CER2])    {
        SER 
        N
        SER
        CMD2
        CM
        CM
        CM
        CM2
        CT2
        O
        CM
        CM
        CM
        CM
        CM
        CM
        CM
        CT2
    }

    set map([list name CER2])    {
        OH1
        N
        OH2
        CS3
        CS4
        CS5
        CS6
        CS7
        CS8
        OA1
        CA2
        CA3
        CA4
        CA5
        CA6
        CA7
        CA8
        CA9
    }

    set map([list charge CER2])  {
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
        0.0
        0.0
        0.0
    }

    set map([list mass CER2])    {
       31.0344
       28.0340
       30.0264
       26.0380
       42.0810
       42.0810
       42.0810
       28.0540
       29.0620
       28.0100
       42.0810
       42.0810
       42.0810
       42.0810
       42.0810
       42.0810
       42.0810
       29.0620
    }

    set map([list bonds CER2]) {
         {OH1 N} {OH2 N} {OH2 CS3}
         {CS3 CS4} {CS4 CS5} {CS5 CS6}
         {CS6 CS7} {CS7 CS8} {N OA1}
         {OA1 CA2} {CA2 CA3} {CA3 CA4} {CA4 CA5}
         {CA5 CA6} {CA6 CA7} {CA7 CA8}
         {CA8 CA9}
    }

    set map([list angles CER2]) {
        {auto}
    }

    return

}

::CGtools::map_ceramide

if { $::CGtools::maptest } {
    ::CGtools::map_stats {CER1 CER2}
}
