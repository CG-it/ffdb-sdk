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

proc ::CGtools::map_kevlar {} {

    variable map

    ## Kevlar Monomer
    set map([list map KEVL]) {
        {N1 H5 H6}
        {C3}
        {C1 C2 H1 H2}
        {C4 C5 H3 H4}
        {C6}
        {N2 H7}
        {C7 O1}
        {C8}
        {C9 C10 H8 H9}
        {C11 C12 H10 H11}
        {C13}
        {C14 O2 O3 H12}
    }

    set map([list type KEVL])    {
      N
      BER
      BER
      BER
      BER
      N
      O
      BER
      BER
      BER
      BER
      COOH
    }

    set map([list name KEVL])    {
      N1
      C2
      C3
      C4
      C5
      N6
      O7
      C8
      C9
      C10
      C11
      O12
    }

    set map([list charge KEVL])  {
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

    set map([list mass KEVL]) {
      {16.02}
      {19.03}
      {19.03}
      {19.03}
      {19.03}
      {15.01}
      {28.01}
      {19.03}
      {19.03}
      {19.03}
      {19.03}
      {45.02}
    }

    set map([list bonds KEVL]) {
        {N1 C2}
        {C2 C3}
        {C2 C4}
        {C3 C5}
        {C4 C5}
        {C5 N6}
        {N6 O7}
        {O7 C8}
        {C8 C9}
        {C8 C10}
        {C9 C11}
        {C10 C11}
        {C11 O12}
    }

    set map([list angles KEVL]) {
      {auto}
    }

#    set map([list angles KEVL]) {
#        {N1 C2 C3}
#        {N1 C2 C4}
#        {C2 C3 C5}
#        {C3 C2 C4}
#        {C3 C5 C4}
#        {C2 C4 C5}
#        {C3 C5 N6}
#        {C4 C5 N6}
#        {C5 N6 O7}
#        {N6 O7 C8}
#        {O7 C8 C9}
#        {C8 C9 C11}
#        {C8 C10 C11}
#        {C9 C8 C10}
#        {C9 C11 C10}
#        {C9 C11 O12}
#        {C10 C11 O12}
#    }

    ## Diehdrals to retain planarity
    ## between aryls
    set map([list dihedrals KEVL]) {
        {C4 C5 N6 O7}
        {N6 O7 C8 C9}
        {C5 N6 O7 C8}
    }

    return
}

::CGtools::map_kevlar

if { $::CGtools::maptest } {
    ::CGtools::map_stats KEVL
    ::CGtools::checkbonds KEVL
}
