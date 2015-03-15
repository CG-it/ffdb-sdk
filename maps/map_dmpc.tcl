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

# Loading CG mappings from map_dmpc.tcl
# ========= DMPC =========
#     charge DMPC    13
#       mass DMPC    13
#       name DMPC    13
#    map DMPC    13
#       type DMPC    13
#
# charge DMPC   | mass DMPC | name DMPC | map DMPC                                                                           | type DMPC |
# 0.1118033989 | 87.1634   | NC        | N C11 H11A H11B C12 H12A H12B C13 H13A H13B H13C C14 H14A H14B H14C C15 H15A H15B H15C | NC        |
# -0.1118033989 | 94.9714   | PH        | P O11 O12 O13 O14                                                                      | PH        |
# 0.0           | 41.0718   | GL        | C1 HA HB C2 HS C3 HX HY                                                                | GL        |
# 0.0           | 58.0361   | EST1      | O21 C21 O22 C22 H2R H2S                                                                | EST1      |
# 0.0           | 42.0797   | C11       | C23 H3R H3S C24 H4R H4S C25 H5R H5S                                                    | CM        |
# 0.0           | 42.0797   | C12       | C26 H6R H6S C27 H7R H7S C28 H8R H8S                                                    | CM        |
# 0.0           | 42.0797   | C13       | C29 H9R H9S C210 H10R H10S C211 H11R H11S                                              | CM        |
# 0.0           | 43.0877   | C14       | C212 H12R H12S C213 H13R H13S C214 H14R H14S H14T                                      | CT        |
# 0.0           | 58.0361   | EST2      | O31 C31 O32 C32 H2X H2Y                                                                | EST2      |
# 0.0           | 42.0797   | C21       | C33 H3X H3Y C34 H4X H4Y C35 H5X H5Y                                                    | CM        |
# 0.0           | 42.0797   | C22       | C36 H6X H6Y C37 H7X H7Y C38 H8X H8Y                                                    | CM        |
# 0.0           | 42.0797   | C23       | C39 H9X H9Y C310 H10X H10Y C311 H11X H11Y                                              | CM        |
# 0.0           | 43.0877   | C24       | C312 H12X H12Y C313 H13X H13Y C314 H14X H14Y H14Z                                      | CT        |
#
# checkbonds: DMPC OK

proc ::CGtools::map_dmpc {} {

    variable map

    # +--------------+
    # |     DMPC     |
    # +--------------+

    set map([list type DMPC]) {
        NC
        PH
        GL
        EST1
        CM
        CM
        CM
        CT
        EST2
        CM
        CM
        CM
        CT
    }

    set map([list name DMPC]) {
        NC
        PH
        GL
        EST1
        C11
        C12
        C13
        C14
        EST2
        C21
        C22
        C23
        C24
    }

    set map([list map DMPC]) {
        {N C11 H11A H11B C12 H12A H12B C13 H13A H13B H13C C14 H14A H14B H14C C15 H15A H15B H15C}
        {P O11 O12 O13 O14}
        {C1 HA HB C2 HS C3 HX HY}
        {O21 C21 O22 C22 H2R H2S}
        {C23 H3R H3S C24 H4R H4S C25 H5R H5S}
        {C26 H6R H6S C27 H7R H7S C28 H8R H8S}
        {C29 H9R H9S C210 H10R H10S C211 H11R H11S}
        {C212 H12R H12S C213 H13R H13S C214 H14R H14S H14T}
        {O31 C31 O32 C32 H2X H2Y}
        {C33 H3X H3Y C34 H4X H4Y C35 H5X H5Y}
        {C36 H6X H6Y C37 H7X H7Y C38 H8X H8Y}
        {C39 H9X H9Y C310 H10X H10Y C311 H11X H11Y}
        {C312 H12X H12Y C313 H13X H13Y C314 H14X H14Y H14Z}
    }

    set map([list charge DMPC]) {
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
    }

    set map([list mass DMPC]) {
        87.1634
        94.9714
        41.0718
        58.0361
        42.0797
        42.0797
        42.0797
        43.0877
        58.0361
        42.0797
        42.0797
        42.0797
        43.0877
    }

    set map([list bonds DMPC]) {
        {NC PH}
        {PH GL}
        {GL EST1}
        {EST1 C11}
        {C11 C12}
        {C12 C13}
        {C13 C14}
        {GL EST2}
        {EST2 C21}
        {C21 C22}
        {C22 C23}
        {C23 C24}
    }

    set map([list angles DMPC]) {
        {auto}
    }

    set map([list atomicnumber DMPC]) {
        50
        47
        23
        30
        24
        24
        24
        25
        30
        24
        24
        24
        25
    }

    # +--------------+
    # |     DMPC2    |
    # +--------------+
    # Alternative Mapping to DMPC with one extra bead

    set map([list type DMPC2]) {
        NC
        PH
        GL
        EST1
        CM
        CM
        CM2
        CM2
        CT2
        EST2
        CM
        CM
        CM2
        CM2
        CT2
    }

    set map([list name DMPC2]) {
        NC
        PH
        GL
        EST1
        C11
        C12
        C13
        C14
        C15
        EST2
        C21
        C22
        C23
        C24
        C25
    }

    set map([list map DMPC2]) {
        {N C11 H11A H11B C12 H12A H12B C13 H13A H13B H13C C14 H14A H14B H14C C15 H15A H15B H15C}
        {P O11 O12 O13 O14}
        {C1 HA HB C2 HS C3 HX HY}
        {O21 C21 O22 C22 H2R H2S}
        {C23 H3R H3S C24 H4R H4S C25 H5R H5S}
        {C26 H6R H6S C27 H7R H7S C28 H8R H8S}
        {C29 H9R H9S C210 H10R H10S}
        {C211 H11R H11S C212 H12R H12S}
        {C213 H13R H13S C214 H14R H14S H14T}
        {O31 C31 O32 C32 H2X H2Y}
        {C33 H3X H3Y C34 H4X H4Y C35 H5X H5Y}
        {C36 H6X H6Y C37 H7X H7Y C38 H8X H8Y}
        {C39 H9X H9Y C310 H10X H10Y}
        {C311 H11X H11Y C312 H12X H12Y}
        {C313 H13X H13Y C314 H14X H14Y H14Z}
    }

    set map([list charge DMPC2]) {
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
    }

    set map([list mass DMPC2]) {
        { 87.1660}
        { 94.9716}
        { 41.0730}
        { 58.0368}
        { 42.0810}
        { 42.0810}
        { 28.0540}
        { 28.0540}
        { 29.0620}
        { 58.0368}
        { 42.0810}
        { 42.0810}
        { 28.0540}
        { 28.0540}
        { 29.0620}
    }

    set map([list bonds DMPC2]) {
        {NC PH}
        {PH GL}
        {GL EST1}
        {EST1 C11}
        {C11 C12}
        {C12 C13}
        {C13 C14}
        {C14 C15}
        {GL EST2}
        {EST2 C21}
        {C21 C22}
        {C22 C23}
        {C23 C24}
        {C24 C25}
    }

    set map([list angles DMPC2]) {
        {auto}
    }

    set map([list atomicnumber DMPC2]) {
        50
        47
        23
        30
        24
        24
        16
        16
        17
        30
        24
        24
        16
        16
        17
    }

    # +--------------+
    # |     DMPC3    |
    # +--------------+
    # Alternative Mapping to DMPC with one extra bead

    set map([list type DMPC3]) {
        NC
        PH
        GL
        EST1
        CM
        CM2
        CM
        CM2
        CT2
        EST2
        CM
        CM2
        CM
        CM2
        CT2
    }

    set map([list name DMPC3]) {
        NC
        PH
        GL
        EST1
        C11
        C12
        C13
        C14
        C15
        EST2
        C21
        C22
        C23
        C24
        C25
    }

    set map([list map DMPC3]) {
        {N C11 H11A H11B C12 H12A H12B C13 H13A H13B H13C C14 H14A H14B H14C C15 H15A H15B H15C}
        {P O11 O12 O13 O14}
        {C1 HA HB C2 HS C3 HX HY}
        {O21 C21 O22 C22 H2R H2S}
        {C23 H3R H3S C24 H4R H4S C25 H5R H5S}
        {C26 H6R H6S C27 H7R H7S}
        {C28 H8R H8S C29 H9R H9S C210 H10R H10S}
        {C211 H11R H11S C212 H12R H12S}
        {C213 H13R H13S C214 H14R H14S H14T}
        {O31 C31 O32 C32 H2X H2Y}
        {C33 H3X H3Y C34 H4X H4Y C35 H5X H5Y}
        {C36 H6X H6Y C37 H7X H7Y}
        {C38 H8X H8Y C39 H9X H9Y C310 H10X H10Y}
        {C311 H11X H11Y C312 H12X H12Y}
        {C313 H13X H13Y C314 H14X H14Y H14Z}
    }

    set map([list charge DMPC3]) {
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
    }

    set map([list mass DMPC3]) {
        { 87.1660}
        { 94.9716}
        { 41.0730}
        { 58.0368}
        { 42.0810}
        { 28.0540}
        { 42.0810}
        { 28.0540}
        { 29.0620}
        { 58.0368}
        { 42.0810}
        { 28.0540}
        { 42.0810}
        { 28.0540}
        { 29.0620}
    }

    set map([list bonds DMPC3]) {
        {NC PH}
        {PH GL}
        {GL EST1}
        {EST1 C11}
        {C11 C12}
        {C12 C13}
        {C13 C14}
        {C14 C15}
        {GL EST2}
        {EST2 C21}
        {C21 C22}
        {C22 C23}
        {C23 C24}
        {C24 C25}
    }

    set map([list angles DMPC3]) {
        {auto}
    }

    set map([list atomicnumber DMPC3]) {
        50
        47
        23
        30
        24
        16
        24
        16
        17
        30
        24
        16
        24
        16
        17
    }

    return
}

::CGtools::map_dmpc

if { $::CGtools::maptest } {
    ::CGtools::map_stats DMPC
    ::CGtools::checkbonds DMPC
    ::CGtools::map_stats DMPC2
    ::CGtools::checkbonds DMPC2
    ::CGtools::map_stats DMPC3
    ::CGtools::checkbonds DMPC3
}
