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

## Mappings for a 36-residue toy helix

proc ::CGtools::map_thlx {} {

    variable map

    # +--------------+
    # |     THLX35   |
    # +--------------+

    set map([list type THLX35]) {
        EO EO EO EO CM CM CM
        CM CM CM CM CM CM CM
        CM CM CM CM CM CM CM
        CM CM CM CM CM CM CM
        CM CM CM EO EO EO EO
    }

    set map([list name THLX35]) {
        C1 C2 C3 C4 C5 C6 C7
        C8 C9 C10 C11 C12 C13 C14
        C15 C16 C17 C18 C19 C20 C21
        C22 C23 C24 C25 C26 C27 C28
        C29 C30 C31 C32 C33 C34 C35
    }

    set map([list map THLX35]) {
        C1 C2 C3 C4 C5 C6 C7
        C8 C9 C10 C11 C12 C13 C14
        C15 C16 C17 C18 C19 C20 C21
        C22 C23 C24 C25 C26 C27 C28
        C29 C30 C31 C32 C33 C34 C35

    }

    set map([list charge THLX35]) {
        0.0 0.0 0.0 0.0 0.0 0.0 0.0
        0.0 0.0 0.0 0.0 0.0 0.0 0.0
        0.0 0.0 0.0 0.0 0.0 0.0 0.0
        0.0 0.0 0.0 0.0 0.0 0.0 0.0
        0.0 0.0 0.0 0.0 0.0 0.0 0.0
    }

    set map([list mass THLX35]) {
        42.0797 42.0797 42.0797 42.0797 42.0797 42.0797 42.0797
        42.0797 42.0797 42.0797 42.0797 42.0797 42.0797 42.0797
        42.0797 42.0797 42.0797 42.0797 42.0797 42.0797 42.0797
        42.0797 42.0797 42.0797 42.0797 42.0797 42.0797 42.0797
        42.0797 42.0797 42.0797 42.0797 42.0797 42.0797 42.0797
    }

    ## Simple network Model
    set map([list bonds THLX35]) {
        {C1 C2}   {C1 C3}   {C1 C4}   {C1 C5}
        {C2 C3}   {C2 C4}   {C2 C5}   {C2 C6}
        {C3 C4}   {C3 C5}   {C3 C6}   {C3 C7}
        {C4 C5}   {C4 C6}   {C4 C7}   {C4 C8}
        {C5 C6}   {C5 C7}   {C5 C8}   {C5 C9}
        {C6 C7}   {C6 C8}   {C6 C9}   {C6 C10}
        {C7 C8}   {C7 C9}   {C7 C10}  {C7 C11}
        {C8 C9}   {C8 C10}  {C8 C11}  {C8 C12}
        {C9 C10}  {C9 C11}  {C9 C12}  {C9 C13}
        {C10 C11} {C10 C12} {C10 C13} {C10 C14}
        {C11 C12} {C11 C13} {C11 C14} {C11 C15}
        {C12 C13} {C12 C14} {C12 C15} {C12 C16}
        {C13 C14} {C13 C15} {C13 C16} {C13 C17}
        {C14 C15} {C14 C16} {C14 C17} {C14 C18}
        {C15 C16} {C15 C17} {C15 C18} {C15 C19}
        {C16 C17} {C16 C18} {C16 C19} {C16 C20}
        {C17 C18} {C17 C19} {C17 C20} {C17 C21}
        {C18 C19} {C18 C20} {C18 C21} {C18 C22}
        {C19 C20} {C19 C21} {C19 C22} {C19 C23}
        {C20 C21} {C20 C22} {C20 C23} {C20 C24}
        {C21 C22} {C21 C23} {C21 C24} {C21 C25}
        {C22 C23} {C22 C24} {C22 C25} {C22 C26}
        {C23 C24} {C23 C25} {C23 C26} {C23 C27}
        {C24 C25} {C24 C26} {C24 C27} {C24 C28}
        {C25 C26} {C25 C27} {C25 C28} {C25 C29}
        {C26 C27} {C26 C28} {C26 C29} {C26 C30}
        {C27 C28} {C27 C29} {C27 C30} {C27 C31}
        {C28 C29} {C28 C30} {C28 C31} {C28 C32}
        {C29 C30} {C29 C31} {C29 C32} {C29 C33}
        {C30 C31} {C30 C32} {C30 C33} {C30 C34}
        {C31 C32} {C31 C33} {C31 C34} {C31 C35}
        {C32 C33} {C32 C34} {C32 C35}
        {C33 C34} {C33 C35}
        {C34 C35}
    }

    ## no angles for now
    set map([list angles THLX35]) {
        {none}
    }

    set map([list atomicnumber THLX35]) {
        24 24 24 24 24 24
        24 24 24 24 24 24
        24 24 24 24 24 24
        24 24 24 24 24 24
        24 24 24 24 24 24
        24 24 24 24 24 24
    }

    # +--------------+
    # |     THLX49   |
    # +--------------+

    set map([list type THLX49]) {
        EO EO EO EO CM CM CM
        CM CM CM CM CM CM CM
        CM CM CM CM CM CM CM
        CM CM CM CM CM CM CM
        CM CM CM CM CM CM CM
        CM CM CM CM CM CM CM
        CM CM CM EO EO EO EO
    }

    set map([list name THLX49]) {
        C1 C2 C3 C4 C5 C6 C7
        C8 C9 C10 C11 C12 C13 C14
        C15 C16 C17 C18 C19 C20 C21
        C22 C23 C24 C25 C26 C27 C28
        C29 C30 C31 C32 C33 C34 C35
        C36 C37 C38 C39 C40 C41 C42
        C43 C44 C45 C46 C47 C48 C49
    }

    set map([list map THLX49]) {
        C1 C2 C3 C4 C5 C6 C7
        C8 C9 C10 C11 C12 C13 C14
        C15 C16 C17 C18 C19 C20 C21
        C22 C23 C24 C25 C26 C27 C28
        C29 C30 C31 C32 C33 C34 C35
        C36 C37 C38 C39 C40 C41 C42
        C43 C44 C45 C46 C47 C48 C49
    }

    set map([list charge THLX49]) {
        0.0 0.0 0.0 0.0 0.0 0.0 0.0
        0.0 0.0 0.0 0.0 0.0 0.0 0.0
        0.0 0.0 0.0 0.0 0.0 0.0 0.0
        0.0 0.0 0.0 0.0 0.0 0.0 0.0
        0.0 0.0 0.0 0.0 0.0 0.0 0.0
        0.0 0.0 0.0 0.0 0.0 0.0 0.0
        0.0 0.0 0.0 0.0 0.0 0.0 0.0
    }

    set map([list mass THLX49]) {
        42.0797 42.0797 42.0797 42.0797 42.0797 42.0797 42.0797
        42.0797 42.0797 42.0797 42.0797 42.0797 42.0797 42.0797
        42.0797 42.0797 42.0797 42.0797 42.0797 42.0797 42.0797
        42.0797 42.0797 42.0797 42.0797 42.0797 42.0797 42.0797
        42.0797 42.0797 42.0797 42.0797 42.0797 42.0797 42.0797
        42.0797 42.0797 42.0797 42.0797 42.0797 42.0797 42.0797
        42.0797 42.0797 42.0797 42.0797 42.0797 42.0797 42.0797
    }

    ## Simple network Model
    set map([list bonds THLX49]) {
        {C1 C2}   {C1 C3}   {C1 C4}   {C1 C5}
        {C2 C3}   {C2 C4}   {C2 C5}   {C2 C6}
        {C3 C4}   {C3 C5}   {C3 C6}   {C3 C7}
        {C4 C5}   {C4 C6}   {C4 C7}   {C4 C8}
        {C5 C6}   {C5 C7}   {C5 C8}   {C5 C9}
        {C6 C7}   {C6 C8}   {C6 C9}   {C6 C10}
        {C7 C8}   {C7 C9}   {C7 C10}  {C7 C11}
        {C8 C9}   {C8 C10}  {C8 C11}  {C8 C12}
        {C9 C10}  {C9 C11}  {C9 C12}  {C9 C13}
        {C10 C11} {C10 C12} {C10 C13} {C10 C14}
        {C11 C12} {C11 C13} {C11 C14} {C11 C15}
        {C12 C13} {C12 C14} {C12 C15} {C12 C16}
        {C13 C14} {C13 C15} {C13 C16} {C13 C17}
        {C14 C15} {C14 C16} {C14 C17} {C14 C18}
        {C15 C16} {C15 C17} {C15 C18} {C15 C19}
        {C16 C17} {C16 C18} {C16 C19} {C16 C20}
        {C17 C18} {C17 C19} {C17 C20} {C17 C21}
        {C18 C19} {C18 C20} {C18 C21} {C18 C22}
        {C19 C20} {C19 C21} {C19 C22} {C19 C23}
        {C20 C21} {C20 C22} {C20 C23} {C20 C24}
        {C21 C22} {C21 C23} {C21 C24} {C21 C25}
        {C22 C23} {C22 C24} {C22 C25} {C22 C26}
        {C23 C24} {C23 C25} {C23 C26} {C23 C27}
        {C24 C25} {C24 C26} {C24 C27} {C24 C28}
        {C25 C26} {C25 C27} {C25 C28} {C25 C29}
        {C26 C27} {C26 C28} {C26 C29} {C26 C30}
        {C27 C28} {C27 C29} {C27 C30} {C27 C31}
        {C28 C29} {C28 C30} {C28 C31} {C28 C32}
        {C29 C30} {C29 C31} {C29 C32} {C29 C33}
        {C30 C31} {C30 C32} {C30 C33} {C30 C34}
        {C31 C32} {C31 C33} {C31 C34} {C31 C35}
        {C32 C33} {C32 C34} {C32 C35} {C32 C36}
        {C33 C34} {C33 C35} {C33 C36} {C33 C37}
        {C34 C35} {C34 C36} {C34 C37} {C34 C38}
        {C35 C36} {C35 C37} {C35 C38} {C35 C39}
        {C36 C37} {C36 C38} {C36 C39} {C36 C40}
        {C37 C38} {C37 C39} {C37 C40} {C37 C41}
        {C38 C39} {C38 C40} {C38 C41} {C38 C42}
        {C39 C40} {C39 C41} {C39 C42} {C39 C43}
        {C40 C41} {C40 C42} {C40 C43} {C40 C44}
        {C41 C42} {C41 C43} {C41 C44} {C41 C45}
        {C42 C43} {C42 C44} {C42 C45} {C42 C46}
        {C43 C44} {C43 C45} {C43 C46} {C43 C47}
        {C44 C45} {C44 C46} {C44 C47} {C44 C48}
        {C45 C46} {C45 C47} {C45 C48} {C45 C49}
    }

    ## no angles for now
    set map([list angles THLX49]) {
        {none}
    }

    set map([list atomicnumber THLX49]) {
        24 24 24 24 24 24 24
        24 24 24 24 24 24 24
        24 24 24 24 24 24 24
        24 24 24 24 24 24 24
        24 24 24 24 24 24 24
        24 24 24 24 24 24 24
        24 24 24 24 24 24 24
    }

    return
}

    ::CGtools::map_thlx

    if { $::CGtools::maptest } {
        ::CGtools::map_stats THLX35
        ::CGtools::checkbonds THLX35
        ::CGtools::map_stats THLX49
        ::CGtools::checkbonds THLX49
    }
