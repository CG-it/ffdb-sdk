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

## No need to modify anything up here.

# Loading CG mappings from map_dopc.tcl
# ========= DOPC =========
# atomicnumber DOPC    17
#     charge DOPC    17
#       mass DOPC    17
#       name DOPC    17
#    map DOPC    17
#       type DOPC    17

# atomicnumber DOPC | charge DOPC   | mass DOPC | name DOPC | map DOPC                                                                           | type DOPC |
# 50                | +0.1118033989 | 87.1647   | NC        | N C11 H11A H11B C12 H12A H12B C13 H13A H13B H13C C14 H14A H14B H14C C15 H15A H15B H15C | NC        |
# 47                | -0.1118033989 | 94.9716   | PH        | P O11 O12 O13 O14                                                                      | PH        |
# 23                | 0.0           | 41.0725   | GL        | C1 HA HB C2 HS C3 HX HY                                                                | GL        |
# 30                | 0.0           | 58.0358   | EST1      | O21 C21 O22 C22 H2R H2S                                                                | EST1      |
# 24                | 0.0           | 42.0804   | C11       | C23 H3R H3S C24 H4R H4S C25 H5R H5S                                                    | CM        |
# 24                | 0.0           | 42.0804   | C12       | C26 H6R H6S C27 H7R H7S C28 H8R H8S                                                    | CM        |
# 14                | 0.0           | 26.0378   | C13       | C29 H91 C210 H101                                                                      | CMD2      |
# 24                | 0.0           | 42.0804   | C14       | C211 H11R H11S C212 H12R H12S C213 H13R H13S                                           | CM        |
# 24                | 0.0           | 42.0804   | C15       | C214 H14R H14S C215 H15R H15S C216 H16R H16S                                           | CM        |
# 17                | 0.0           | 29.0615   | C16       | C217 H17R H17S C218 H18R H18S H18T                                                     | CT2       |
# 30                | 0.0           | 58.0358   | EST2      | O31 C31 O32 C32 H2X H2Y                                                                | EST2      |
# 24                | 0.0           | 42.0804   | C21       | C33 H3X H3Y C34 H4X H4Y C35 H5X H5Y                                                    | CM        |
# 24                | 0.0           | 42.0804   | C22       | C36 H6X H6Y C37 H7X H7Y C38 H8X H8Y                                                    | CM        |
# 14                | 0.0           | 26.0378   | C23       | C39 H9X C310 H10X                                                                      | CMD2      |
# 24                | 0.0           | 42.0804   | C24       | C311 H11X H11Y C312 H12X H12Y C313 H13X H13Y                                           | CM        |
# 24                | 0.0           | 42.0804   | C25       | C314 H14X H14Y C315 H15X H15Y C316 H16X H16Y                                           | CM        |
# 17                | 0.0           | 29.0615   | C26       | C317 H17X H17Y C318 H18X H18Y H18Z                                                     | CT2       |

# checkbonds: DOPC OK
# checkangles: DOPC auto

proc ::CGtools::map_popc {} {

    variable map

    # +--------------+
    # |     DOPC     |
    # +--------------+

    set map([list type DOPC]) {
        NC   
        PH   
        GL   
        EST1 
        CM   
        CM   
        CMD2 
        CM   
        CM   
        CT2  
        EST2 
        CM   
        CM   
        CMD2 
        CM   
        CM   
        CT2  
    }

    set map([list name DOPC]) {
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

    set map([list map DOPC]) {
        {N C11 H11A H11B C12 H12A H12B C13 H13A H13B H13C C14 H14A H14B H14C C15 H15A H15B H15C}   
        {P O11 O12 O13 O14}                                                                        
        {C1 HA HB C2 HS C3 HX HY}                                                                  
        {O21 C21 O22 C22 H2R H2S}                                                                  
        {C23 H3R H3S C24 H4R H4S C25 H5R H5S}                                                      
        {C26 H6R H6S C27 H7R H7S C28 H8R H8S}                                                      
        {C29 H91 C210 H101}                                                                        
        {C211 H11R H11S C212 H12R H12S C213 H13R H13S}                                             
        {C214 H14R H14S C215 H15R H15S C216 H16R H16S}                                             
        {C217 H17R H17S C218 H18R H18S H18T}                                                       
        {O31 C31 O32 C32 H2X H2Y}                                                                  
        {C33 H3X H3Y C34 H4X H4Y C35 H5X H5Y}                                                      
        {C36 H6X H6Y C37 H7X H7Y C38 H8X H8Y}                                                      
        {C39 H9X C310 H10X}                                                
        {C311 H11X H11Y C312 H12X H12Y C313 H13X H13Y}                                             
        {C314 H14X H14Y C315 H15X H15Y C316 H16X H16Y}                                                       
        {C317 H17X H17Y C318 H18X H18Y H18Z}                                                       
    }

    set map([list charge DOPC]) {
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

    set map([list mass DOPC]) {
        87.1647
        94.9716
        41.0725
        58.0358
        42.0804
        42.0804
        26.0378
        42.0804
        42.0804
        29.0615
        58.0358
        42.0804
        42.0804
        26.0378
        42.0804
        42.0804
        29.0615
    }

    set map([list bonds DOPC]) {
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

    set map([list angles DOPC]) {
      {auto}
    }

    set map([list atomicnumber DOPC]) {
        50
        47
        23
        30
        24
        24
        14
        24
        24
        17
        30
        24
        24
        14
        24
        24
        17
    }

    return
}

## Load the map into the map array
::CGtools::map_popc

## Run tests if requested
if { $::CGtools::maptest } {
    ::CGtools::map_stats   DOPC
    ::CGtools::checkbonds  DOPC
    ::CGtools::checkangles DOPC
}
