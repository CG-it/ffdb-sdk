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


proc ::CGtools::map_peg {} {

    variable map

    

    # +-------------+
    # |    C12E2    |
    # +-------------+

    set map([list map G122]) {
        {OA }
        {EO1}
        {EO2}
        {C3 }
        {C4 }
        {C5 }
        {C6 }
    }

    set map([list type G122])    {
        OA 
        EO 
        EO 
        CM 
        CM 
        CM 
        CT2
    }

    set map([list name G122])    {
        OA 
        EO1
        EO2
        C3 
        C4 
        C5 
        C6 
    }

    set map([list charge G122])  {
        0.0
        0.0
        0.0
        0.0
        0.0
        0.0
        0.0
    }

    set map([list mass G122])    {
        31.0340
        44.0534
        44.0534
        42.0804
        42.0804
        42.0804
        29.0620
    }

    set map([list bonds G122]) {
        {OA EO1}
        {EO1 EO2}
        {EO2 C3}
        {C3 C4}
        {C4 C5}
        {C5 C6}
    }

    set map([list angles G122]) {
      {auto}
    }


    # +-------------+
    # |    C18E6    |
    # +-------------+

    set map([list map G186]) {
        {OA }
        {EO1}
        {EO2}
        {EO3}
        {EO4}
        {EO5}
        {EO6}
        {C7 }
        {C8 }
        {C9 }
        {C10}
        {C11}
        {C12}
    }

    set map([list type G186])    {
        OA 
        EO 
        EO 
        EO 
        EO 
        EO 
        EO 
        CM 
        CM 
        CM 
        CM 
        CM 
        CT2
    }

    set map([list name G186])    {
        OA 
        EO1
        EO2
        EO3
        EO4
        EO5
        EO6
        C7 
        C8 
        C9 
        C10
        C11
        C12
    }

    set map([list charge G186])  {
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

    set map([list mass G186])    {
        31.0340
        44.0534
        44.0534
        44.0534
        44.0534
        44.0534
        44.0534
        42.0804
        42.0804
        42.0804
        42.0804
        42.0804
        29.0620
    }

    set map([list bonds G186]) {
        {OA EO1}
        {EO1 EO2}
        {EO2 EO3}
        {EO3 EO4}
        {EO4 EO5}
        {EO5 EO6}
        {EO6 C7}
        {C7 C8}
        {C8 C9}
        {C9 C10}
        {C10 C11}
        {C11 C12}
    }

    set map([list angles G186]) {
      {auto}
    }

    return

}

::CGtools::map_peg

if { $::CGtools::maptest } {

    foreach r {G186} {
        ::CGtools::map_stats $r
        ::CGtools::checkbonds $r
        ::CGtools::checkangles $r
    }
}
