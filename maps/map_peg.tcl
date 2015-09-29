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

    #PEG2 - C4O3

    set map([list map PEG2]) {
        {OA1}
        {EO1}
        {OA2}
    }

    set map([list type PEG2])    {
        OA
        EO
        OA
    }

    set map([list name PEG2])    {
        OA1
        EO1
        OA2
    }

    set map([list charge PEG2])  {
        0.0
        0.0
        0.0
    }

    set map([list mass PEG2])    {
        31.03
        44.05
        31.03
    }

    set map([list bonds PEG2]) {
        {OA1 EO1}
        {EO1 OA2}
    }

    set map([list angles PEG2]) {
      {auto}
    }

    #PEG3 - C6O4

    set map([list map PEG3]) {
        {OA1}
        {EO1}
        {EO2}
        {OA2}
    }

    set map([list type PEG3])    {
        OA
        EO
        EO
        OA
    }

    set map([list name PEG3])    {
        OA1
        EO1
        EO2
        OA2
    }

    set map([list charge PEG3])  {
        0.0
        0.0
        0.0
        0.0
    }

    set map([list mass PEG3])    {
        31.03
        44.05
        44.05
        31.03
    }

    set map([list bonds PEG3]) {
        {OA1 EO1}
        {EO1 EO2}
        {EO2 OA2}
    }

    set map([list angles PEG3]) {
      {auto}
    }

    #PEG4 - C8O5
    set map([list map PEG4]) {
        {OA1}
        {EO1}
        {EO2}
        {EO3}
        {OA2}
    }

    set map([list type PEG4])    {
        OA
        EO
        EO
        EO
        OA
    }

    set map([list name PEG4])    {
        OA1
        EO1
        EO2
        EO3
        OA2
    }

    set map([list charge PEG4])  {
        0.0
        0.0
        0.0
        0.0
        0.0
    }

    set map([list mass PEG4])    {
        31.03
        44.05
        44.05
        44.05
        31.03
    }

    set map([list bonds PEG4]) {
        {OA1 EO1}
        {EO1 EO2}
        {EO2 EO3}
        {EO3 OA2}
    }

    set map([list angles PEG4]) {
      {auto}
    }

    #PEG5 - C10O6
    set map([list map PEG5]) {
        {OA1}
        {EO1}
        {EO2}
        {EO3}
        {EO4}
        {OA2}
    }

    set map([list type PEG5])    {
        OA
        EO
        EO
        EO
        EO
        OA
    }

    set map([list name PEG5])    {
        OA1
        EO1
        EO2
        EO3
        EO4
        OA2
    }

    set map([list charge PEG5])  {
        0.0
        0.0
        0.0
        0.0
        0.0
        0.0
    }

    set map([list mass PEG5])    {
        31.03
        44.05
        44.05
        44.05
        44.05
        31.03
    }

    set map([list bonds PEG5]) {
        {OA1 EO1}
        {EO1 EO2}
        {EO2 EO3}
        {EO3 EO4}
        {EO4 OA2}
    }

    set map([list angles PEG5]) {
      {auto}
    }

    #PEG6 - C12O6
    set map([list map PEG6]) {
        {OA1}
        {EO1}
        {EO2}
        {EO3}
        {EO4}
        {EO5}
        {OA2}
    }

    set map([list type PEG6])    {
        OA
        EO
        EO
        EO
        EO
        EO
        OA
    }

    set map([list name PEG6])    {
        OA1
        EO1
        EO2
        EO3
        EO4
        EO5
        OA2
    }

    set map([list charge PEG6])  {
        0.0
        0.0
        0.0
        0.0
        0.0
        0.0
        0.0
    }

    set map([list mass PEG6])    {
        31.03
        44.05
        44.05
        44.05
        44.05
        44.05
        31.03
    }

    set map([list bonds PEG6]) {
        {OA1 EO1}
        {EO1 EO2}
        {EO2 EO3}
        {EO3 EO4}
        {EO4 EO5}
        {EO5 OA2}
    }

    set map([list angles PEG6]) {
      {auto}
    }

    #PEG7 - C14O7
    set map([list map PEG7]) {
        {OA1}
        {EO1}
        {EO2}
        {EO3}
        {EO4}
        {EO5}
        {EO6}
        {OA2}
    }

    set map([list type PEG7])    {
        OA
        EO
        EO
        EO
        EO
        EO
        EO
        OA
    }

    set map([list name PEG7])    {
        OA1
        EO1
        EO2
        EO3
        EO4
        EO5
        EO6
        OA2
    }

    set map([list charge PEG7])  {
        0.0
        0.0
        0.0
        0.0
        0.0
        0.0
        0.0
        0.0
    }

    set map([list mass PEG7])    {
        31.03
        44.05
        44.05
        44.05
        44.05
        44.05
        44.05
        31.03
    }

    set map([list bonds PEG7]) {
        {OA1 EO1}
        {EO1 EO2}
        {EO2 EO3}
        {EO3 EO4}
        {EO4 EO5}
        {EO5 EO6}
        {EO5 OA2}
    }

    set map([list angles PEG7]) {
      {auto}
    }

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

    foreach r {G186 PEG2
      PEG3 PEG4 PEG5 PEG6 PEG7} {
        ::CGtools::map_stats $r
        ::CGtools::checkbonds $r
        ::CGtools::checkangles $r
    }
}
