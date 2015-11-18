#!/usr/bin/tclsh


proc ::CGtools::map_pope {} {

    variable map

    # +--------------+
    # |     POPE     |
    # +--------------+

    set map([list type POPE]) {
        NH
        PHE   
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

    set map([list name POPE]) {
        NH   
        PHE   
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

    set map([list map POPE]) {
        {N HN1 HN2 HN3 C11 H11A H11B C12 H12A H12B}                                  
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

    set map([list charge POPE]) {
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

    set map([list mass POPE]) {
        45.0850
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

    set map([list bonds POPE]) {
        {NH PHE}
        {PHE GL}
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

    set map([list angles POPE]) {
      {auto}
    }

    set map([list atomicnumber POPE]) {
        26
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
        24
        24
        17
    }

    return
}

## Load the map into the map array
::CGtools::map_pope

## Run tests if requested
if { $::CGtools::maptest } {
    ::CGtools::map_stats   POPE
    ::CGtools::checkbonds  POPE
    ::CGtools::checkangles POPE
}


proc ::CGtools::map_dope {} {

    variable map

    # +--------------+
    # |     DOPE     |
    # +--------------+

    set map([list type DOPE]) {
        NH
        PHE   
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

    set map([list name DOPE]) {
        NH   
        PHE   
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

    set map([list map DOPE]) {
        {N HN1 HN2 HN3 C11 H11A H11B C12 H12A H12B}                                  
        {P O11 O12 O13 O14}                                                                        
        {C1 HA HB C2 HS C3 HX HY}                                                                  
        {O21 C21 O22 C22 H2R H2S}
        {C23 H3R H3S C24 H4R H4S C25 H5R H5S}
        {C26 H6R H6S C27 H7R H7S C28 H8R H8S}
        {C29 H9R C210 H10R}
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

    set map([list charge DOPE]) {
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

    set map([list mass DOPE]) {
        45.0850
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

    set map([list bonds DOPE]) {
        {NH PHE}
        {PHE GL}
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

    set map([list angles DOPE]) {
      {auto}
    }

    set map([list atomicnumber DOPE]) {
        26
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
::CGtools::map_dope

## Run tests if requested
if { $::CGtools::maptest } {
    ::CGtools::map_stats   DOPE
    ::CGtools::checkbonds  DOPE
    ::CGtools::checkangles DOPE
}
