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

# Loading CG mappings from map_popc.tcl
# ========= POPC =========
#     charge POPC    16
#       mass POPC    16
#       name POPC    16
#    segname POPC    16
#       type POPC    16
#  
# charge POPC   | mass POPC | name POPC | segname POPC                                                                           | type POPC |
# 0.1118033989 | 87.1647   | NC        | N C11 H11A H11B C12 H12A H12B C13 H13A H13B H13C C14 H14A H14B H14C C15 H15A H15B H15C | NC        |
# -0.1118033989 | 94.9716   | PH        | P O11 O12 O13 O14                                                                      | PH        |
# 0.0           | 41.0725   | GL        | C1 HA HB C2 HS C3 HX HY                                                                | GL        |
# 0.0           | 58.0358   | EST1      | O21 C21 O22 C22 H2R H2S                                                                | EST1      |
# 0.0           | 42.0804   | C11       | C23 H3R H3S C24 H4R H4S C25 H5R H5S                                                    | CM        |
# 0.0           | 42.0804   | C12       | C26 H6R H6S C27 H7R H7S C28 H8R H8S                                                    | CM        |
# 0.0           | 26.0378   | C13       | C29 H91 C210 H101                                                                      | CMD2      |
# 0.0           | 42.0804   | C14       | C211 H11R H11S C212 H12R H12S C213 H13R H13S                                           | CM        |
# 0.0           | 42.0804   | C15       | C214 H14R H14S C215 H15R H15S C216 H16R H16S                                           | CM        |
# 0.0           | 29.0615   | C16       | C217 H17R H17S C218 H18R H18S H18T                                                     | CT2       |
# 0.0           | 58.0358   | EST2      | O31 C31 O32 C32 H2X H2Y                                                                | EST2      |
# 0.0           | 42.0804   | C21       | C33 H3X H3Y C34 H4X H4Y C35 H5X H5Y                                                    | CM        |
# 0.0           | 42.0804   | C22       | C36 H6X H6Y C37 H7X H7Y C38 H8X H8Y                                                    | CM        |
# 0.0           | 42.0804   | C23       | C39 H9X H9Y C310 H10X H10Y C311 H11X H11Y                                              | CM        |
# 0.0           | 42.0804   | C24       | C312 H12X H12Y C313 H13X H13Y C314 H14X H14Y                                           | CM        |
# 0.0           | 29.0615   | C25       | C315 H15X H15Y C316 H16X H16Y H16Z                                                     | CT2       |
#  
# checkbonds: POPC OK

proc ::CGtools::map_popc {} {

    variable map

    

    # +--------------+
    # |     POPC     |
    # +--------------+

    set map([list type POPC]) {
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
        CM   
        CM   
        CT2  
    }

    set map([list name POPC]) {
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
    }

    set map([list segname POPC]) {
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
        {C39 H9X H9Y C310 H10X H10Y C311 H11X H11Y}                                                
        {C312 H12X H12Y C313 H13X H13Y C314 H14X H14Y}                                             
        {C315 H15X H15Y C316 H16X H16Y H16Z}                                                       
    }

    set map([list charge POPC]) {
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
    }

    set map([list mass POPC]) {
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
        42.0804
        42.0804
        29.0615
    }

    set map([list bonds POPC]) {
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
    }

    set map([list angles POPC]) {
      {auto}
    }

    return
}

## Load the map into the map array
::CGtools::map_popc

## Run tests if requested
if { $::CGtools::maptest } {
    ::CGtools::map_stats   POPC
    ::CGtools::checkbonds  POPC
    ::CGtools::checkangles POPC
}
