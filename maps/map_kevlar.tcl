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
        {N1 H11}
        {C2}
        {C3 C4 H31 H41}
        {C6 C7 H61 H71}
        {C5}
        {N8 H81}
        {C9 O10}
        {C11}
        {C12 C13 H12 H13}
        {C15 C16 H15 H16}
        {C14}
        {C17 O18}
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
      O 
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
      {15.02}
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
      {28.01}
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
        {-O12 N1}
    }

    set map([list angles KEVL]) {
      {auto}
    }

    ## Dihedrals to retain planarity
    ## between aryls
    set map([list dihedrals KEVL]) {
        {C4 C5 N6 O7}
        {N6 O7 C8 C9}
        {C5 N6 O7 C8} 
        {C10 C11 O12 +N1}
        {C11 O12 +N1 +C2}
        {O12 +N1 +C2 +C3}
    }

    return
}

::CGtools::map_kevlar

if { $::CGtools::maptest } {
    ::CGtools::map_stats KEVL
    ::CGtools::checkbonds KEVL
}


