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

#Loading CG mappings from map_water.tcl
#========= TIP3 =========
#    charge TIP3     1
#      mass TIP3     1
#      name TIP3     1
#   map TIP3     1
#      type TIP3     1
# 
#charge TIP3 | mass TIP3         | name TIP3 | map TIP3 | type TIP3 |
#0.0         | 54.04600143432617 | W         | OH2          | W         |

#name type mass charge radius element resname resid chain map
#{W W 54.04600143432617 0.0 1.5 X WAT 5894 X W4}


proc ::CGtools::map_water {} {

    variable map

    

    # +--------------+
    # |    WATER     |
    # +--------------+

    set map([list type TIP3]) {
	W
    }

    set map([list name TIP3]) {
	W
    }

    set map([list map TIP3]) {
	{OH2 H1 H2}
    }

    set map([list charge TIP3]) {
	0.0
    }

    set map([list mass TIP3]) {
	54.04600143432617
    }

    set map([list bonds TIP3]) {
      {none}
    }

    set map([list angles TIP3]) {
      {none}
    }

    set map([list atomicnumber TIP3]) {
        30
    }

    set map([list type WAT])      $map([list type TIP3])   
    set map([list name WAT])      $map([list name TIP3])
    set map([list map WAT])   $map([list map TIP3])
    set map([list charge WAT])    $map([list charge TIP3])
    set map([list mass WAT])      $map([list mass TIP3])
    set map([list bonds WAT])     $map([list bonds TIP3])     
    set map([list angles WAT])    $map([list angles TIP3])     
    set map([list atomicnumber WAT]) $map([list atomicnumber TIP3])

    return
}

::CGtools::map_water

if { $::CGtools::maptest } {
    ::CGtools::map_stats   TIP3
    ::CGtools::checkbonds  TIP3
    ::CGtools::checkangles TIP3
}
