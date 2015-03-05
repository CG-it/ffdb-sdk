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

## BEWARE, THESE PARAMETERS MAY NOT BE GOOD!! - CMM 03/03/2015

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

proc ::CGtools::map_ions {} {

    variable map

    # +--------------+
    # |      SOD     |
    # +--------------+

    set map([list type SOD]) {
      SOD
    }

    set map([list name SOD]) {
      SOD
    }

    set map([list map SOD]) {
      SOD
    }

    set map([list charge SOD]) {
      0.1118033989
    }

    #Why is this so large?
    set map([list mass SOD]) {
      77.0342                                                                              
    }

    set map([list bonds SOD]) {
      {none}
    }

    set map([list angles SOD]) {
        {none}
    }

    set map([list dihedrals SOD]) {
      {none}
    }

    set map([list atomicnumber SOD]) {
      11               
    }

    # +--------------+
    # |      CLA     |
    # +--------------+

    set map([list type CLA]) {
      CLA
    }

    set map([list name CLA]) {
      CLA
    }

    set map([list map CLA]) {
      CLA
    }

    set map([list charge CLA]) {
      -0.1118033989
    }

    set map([list mass CLA]) {
      35.453                                                                              
    }

    set map([list bonds CLA]) {
      {none}
    }

    set map([list angles CLA]) {
        {none}
    }

    set map([list dihedrals CLA]) {
      {none}
    }

    set map([list atomicnumber CLA]) {
      17               
    }


    return
}

## Load the map into the map array
::CGtools::map_ions

## Run tests if requested
if { $::CGtools::maptest } {
}
