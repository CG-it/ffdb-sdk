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

# +-------------------------------------------------------------+
# | Prints out a nice formated table of the maps and topologies |
# +-------------------------------------------------------------+

if {![namespace exists ::CGtools]} {
    namespace eval ::CGtools:: {
        variable maptest 1
    }
}

proc ::CGtools::map_stats {{resname all}} {

    variable map

    ## Don't check these properties for consistency
    set ignore {bonds angles}

    if {$resname == "all"} {
        set resname [lsort -unique -dictionary\
                         [lsearch -all -index 1 -subindices -inline \
                              [array names map *] *]]
    }

    ## Array Lengths
    foreach r $resname {

        set keys [lsort -ascii -index 0 [array names map "*$r"]]

        ## Remove ignored keys
        set new_keys $keys
        foreach k $ignore {
            set new_keys [lsearch -not -ascii -all -inline $new_keys "$k*"]
        }
        set keys $new_keys

        puts "========= $r ========="

        set len_list {}
        foreach prop $keys {
            set len [llength $map($prop)]
            puts [format "%15s %5d" $prop $len]
            lappend len_list $len
        }

        if {[llength [lsort -unique -integer $len_list]] > 1} {
            puts "Error: Inconsistent number of values for a property"
            return -code error
        }

        puts ""

        ## Remove extra white space from input formatting
        cleanup_map $r

        ## Print out nice formatted table of side-by-side properties for
        ## each residue and each bead
        set fields {}; set values {}; set format_string {}
        foreach x $keys {
            lappend fields $x; lappend values $map($x)

            set strlen {}
            foreach y $map($x) {
                lappend strlen [string length $y]
            }

            lappend strlen [string length $x]

            ## The longest string for each property
            lappend format_string "%-[lindex [lsort -decreasing -integer $strlen] 0]s |"
        }

        set format_string [join $format_string]

        set np [llength $values]
        set pl [llength [lindex $values 0]]

        puts [format $format_string {*}$fields]
        for {set i 0} {$i < $pl} {incr i} {
            set x [lsearch -all -index $i -subindices -inline $values *]
            puts [format $format_string {*}$x]
        }

        puts ""
    }
}

# +-------------------------------------------+
# |  Checks to make sure that bonds defined   |
# |  in map(bonds resname) are consitent with |
# |  names given in map(name resname)         |
# +-------------------------------------------+

proc ::CGtools::checkbonds {resname} {

    variable map

    foreach r $resname {

        set bonds $map(bonds $r)
        set names $map(name $r)

        ## Skip residues with none option
        if { [lsearch -ascii $bonds "none"] >= 0} {
            puts stdout "checkbonds: $resname $bonds"
            continue
        }

        foreach bond $bonds {
            lassign $bond a b

            if { [lsearch -ascii $names $a] < 0 } {
                puts stderr "checkbonds: Undefined atom name $a"
                return -code error
            }

            if { [lsearch -ascii $names $b] < 0 } {
                puts stderr "checkbonds: Undefined atom name $b"
                return -code error
            }

        }

        puts stdout "checkbonds: $resname OK"
        return -code ok
    }
}

proc ::CGtools::checkangles {resname} {

    variable map

    foreach r $resname {

        set angles $map(angles $r)
        set names $map(name $r)

        ## Skip residues with none/auto option
        if { [lsearch -ascii $angles "none"] >= 0  ||
             [lsearch -ascii $angles "auto"] >= 0 } {
            puts stdout "checkangles: $resname $angles"
            continue
        }

        foreach angle $angles {
            lassign $angle a b c

            if { [lsearch -ascii $names $a] < 0 } {
                puts stderr "checkangles: Undefined atom name $a"
                return -code error
            }

            if { [lsearch -ascii $names $b] < 0 } {
                puts stderr "checkangles: Undefined atom name $b"
                return -code error
            }

            if { [lsearch -ascii $names $c] < 0 } {
                puts stderr "checkangles: Undefined atom name $c"
                return -code error
            }
        }

        puts stdout "checkangles: $resname OK"
        return -code ok
    }
}


# +--------------------------------------------------+
# | Cleanup the map table (remove extra white space) |
# +--------------------------------------------------+

proc ::CGtools::cleanup_map {{resname *}} {

    variable map

    foreach r $resname {
        set keys [lsort -ascii -index 0 [array names map "*$r"]]
        foreach k $keys {
            set temp {}
            foreach x $map($k) {
                lappend temp [string trim $x]
            }
            set map($k) $temp
        }
    }
}

# +--------------------------------------------------------+
# | Calculate the CG masses based on the provided mappings |
# | and a vmd selection for the all atom analogue          |
# +--------------------------------------------------------+

proc ::CGtools::tabulate_mass {sel resname} {

    variable map

    set seltext [$sel text]
    set molid [$sel molid]

    foreach r $resname {

        ## Tabulate the weights, or verify if user specified
        map_weights $r

        ## Make a weight lookup table
        foreach a [join $map([list map $r])]\
            w [join $map([list weights $r])] {
                set wlook($a) $w
            }

        ## Calculate the weighted masses
        set mass {}
        foreach bead $map([list map $r])\
            weights $map([list weights $r]) {
                set tm 0.0
                set sela [atomselect $molid "($seltext) and name $bead"]
                foreach a [$sela get name]\
                    m [$sela get mass] {
                        set tm [expr {$tm + ($m * $wlook($a))}]
                    }
                lappend mass [format "%8.4f" $tm]
                $sela delete
            }
          }
    
    foreach m $mass {puts "\{$m\}"}
    return $mass
}

## Identify hydrogens attached to heavy atoms
proc ::CGtools::get_hydrogens {sel resname} {

    variable map

    set seltext [$sel text]
    set molid [$sel molid]

    ## Get the bond list
    set bl [topo -sel $sel getbondlist]

    ## Create lookup table for hydrogens only
    array set hl {}
    set hyd [atomselect $molid "($seltext) and hydrogen"]
    foreach id_a [$hyd get index] name [$hyd get name] {
        set id_ab [lsearch -inline $bl "*$id_a*"]
        set id_b [lsearch -integer -inline -not $id_ab $id_a]
        lappend hl($id_b) $name
    }

    foreach r $resname {
        set mass {}
        foreach a $map([list map $r]) {
            set sela [atomselect $molid "($seltext) and name $a"]

            ## Get atom indices, cross-refence with topo bond list
            set all {}
            foreach ida [$sela get index]\
                name [$sela get name] {

                    ## If the atom has a hydrogen, note it
                    if {[info exists hl($ida)]} {
                        lappend all "$name [join $hl($ida)]"
                    } else {
                        lappend all $name
                    }
                }
            puts  "\{[join $all]\}"
            $sela delete
        }
    }
}


# +------------------------------------------------------------+
# | Guess the relative weights for the COM calculations        |
# | If an atom is listed twice in a bead, it is assumed        |
# | to be "split" between beads, and thus the relative weights |
# | for the atom in each bead would be 0.5.                    |
# +------------------------------------------------------------+

proc ::CGtools::map_weights {resname} {
    variable map

    foreach r $resname {
        ## Check if the user has requested to guess the weights
        if { ![info exists map([list weights $r])] ||
             [lsearch $map([list weights $r]) "auto"] >= 0} {

            set weights {}

            ## Get a list of all the unique atoms
            set atoms [join $map([list map $r])]
            set uniq_atoms [lsort -unique $atoms]

            set n_atoms [llength $atoms]
            set n_uniq [llength $uniq_atoms]

            ## if the number of atoms equals the number of unique
            ## atoms, we have no duplicates, all weights are 1.0
            if {$n_atoms == $n_uniq} {
                set weights [lrepeat $n_atoms 1.0]
            } else {
                ## Tabulate the weights for each unique atom
                foreach a $uniq_atoms {
                    set n [llength [lsearch -all $atoms $a]]
                    lappend weights [expr 1.0/$n]
                }
            }

            ## Construct the weight list
            set map([list weights $r]) {}
            foreach bead $map([list map $r]) {
                set w {}
                foreach a $bead {
                    set idx [lsearch $uniq_atoms $a]
                    lappend w [lindex $weights $idx]
                }
                lappend map([list weights $r]) $w
            }

        } else {
            ## make sure we have a weight for each atom
            ## if we're not guessing.
            set atoms [join $map([list map $r])]
            set weights [join $map([list weights $r])]
            if {[llength $atoms] != [llength $weights]} {
                puts "Missing a weighting coefficent"
                return -code error
            }
        }
    }

    return -code ok
}

proc ::CGtools::map_check {resname} {

    variable map

    foreach r $resname {
        set flag 0

        ## Check to make sure that all the required fields are provided
        ## by the map: map type name charge mass bonds angles
        set keys {map type name charge mass bonds angles}
        foreach p $keys {
            if {![info exists map([list $p $r])]} {
                puts "Map error, missing field \"$p\" for \"$r\""
                incr flag
            }
        }

        if {$flag > 0} {return -code error}

        ## Check to make sure that all fields are consistent in length
        set keys {map type name charge mass}
        set len_list {}
        foreach p $keys {
            set len [llength $map($p $r)]
            lappend len_list $len
        }

        if {[llength [lsort -unique -integer $len_list]] > 1} {
            puts "Error: Inconsistent number of values for a property for map $r"
            incr flag
        }

        if {$flag > 0} {return -code error}

        #puts stdout "map_check: $resname OK"
        return -code ok
    }
}
