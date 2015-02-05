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


proc ::CGtools::map_alcohol {} {

    variable map

    

    # +-------------+
    # |  Propanol   |
    # +-------------+

    set map([list map PROH]) {
        {O1 HO1 C1 H11 H12}
        {C2 H21 H22 C3 H31 H32 H33}
    }

    set map([list type PROH])    {
        OA
        CT2
    }

    set map([list name PROH])    {
        O
        C1
    }

    set map([list charge PROH])  {
        0.0
        0.0
    }

    set map([list mass PROH])    {
        31.034
        29.062
    }

    set map([list bonds PROH]) {
        {O C1}
    }

    set map([list angles PROH]) {
      {none}
    }

    # +-------------+
    # |  Butanol    |
    # +-------------+

    set map([list map BUTH]) {
        {O1 HO1 C1 H11 H12}
        {C2 H21 H22 C3 H31 H32 C4 H41 H42 H43}
    }

    set map([list type BUTH])    {
        OA
        CT
    }

    set map([list name BUTH])    {
        O
        C1
    }

    set map([list charge BUTH])  {
        0.0
        0.0
    }

    set map([list mass BUTH])    {
        31.034
        43.088
    }

    set map([list bonds BUTH]) {
        {O C1}
    }

    set map([list angles BUTH]) {
      {none}
    }

    # +-------------+
    # |  HEXanol    |
    # +-------------+

    set map([list map HEXH]) {
        {O1 HO1 C1 H11 H12}
        {C2 H21 H22 C3 H31 H32 C4 H41 H42}
        {C5 H51 H52 C6 H61 H62 H63}
    }

    set map([list type HEXH])    {
        OA
        CM
        CT2
    }

    set map([list name HEXH])    {
        O
        C1
        C2
    }

    set map([list charge HEXH])  {
        0.0
        0.0
        0.0
    }

    set map([list mass HEXH])    {
        31.034
        42.080
        29.062
    }

    set map([list bonds HEXH]) {
        {O C1}
        {C1 C2}
    }

    set map([list angles HEXH]) {
        {O C1 C2}
    }

    # +-------------+
    # |  HEPTanol   |
    # +-------------+

    set map([list map HEPH]) {
        {O1 HO1 C1 H11 H12}
        {C2 H21 H22 C3 H31 H32 C4 H41 H42}
        {C5 H51 H52 C6 H61 H62 C7 H71 H72 H73}
    }

    set map([list type HEPH])    {
        OA
        CM
        CT
    }

    set map([list name HEPH])    {
        O
        C1
        C2
    }

    set map([list charge HEPH])  {
        0.0
        0.0
        0.0
    }

    set map([list mass HEPH])    {
        31.034
        42.080
        43.088
    }

    set map([list bonds HEPH]) {
        {O C1}
        {C1 C2}
    }

    set map([list angles HEPH]) {
        {O C1 C2}
    }

    return

}

::CGtools::map_alcohol

if { $::CGtools::maptest } {

    foreach r {PROH BUTH HEXH HEPH} {
        ::CGtools::map_stats $r
        ::CGtools::checkbonds $r
        ::CGtools::checkangles $r
    }
}
