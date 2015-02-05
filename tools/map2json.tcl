#!/usr/bin/tclsh8.5
## Converts the tcl-formatted array "maps"
## to verified json. You can check the output with
## http://jsonformatter.curiousconcept.com/

#./map2json file1 file2 file3 ...

if {![namespace exists ::CGtools]} {
    namespace eval ::CGtools:: {variable maptest 0}
}

## Main command
proc map2json {args} {

    ## Link map array for easy referencing
    array set ::CGtools::map {}
    upvar 0 ::CGtools::map map

    ## Properties to carry over to json
    ## The order specified here is the order that the 
    ## properties will be output
    set props {type name map segname charge mass atomicnumber bonds angles dihedrals}

    set s {}
    lappend s "{"
    lappend s "\"author\":\"$::env(USER)\"," 
    lappend s "\"date\":[clock format [clock seconds] -format \"%Y-%m-%dT%H:%M:%S\"],"
    lappend s "\"fftype\":\"sdk\","
    lappend s "\"topo\":\{"

    foreach f $args {

        array unset map * 

	## Source the file
	if {[catch {source $f} err]} {
	    puts "error loading map file $f: $err"
	}

	## Identify unique molecule topologies
	## in the loaded map
	set resn [lsort -unique -index 1 [array names map]]
	set resn [lsearch -all -inline -index 1 -subindices $resn *]

	## Go molecule-by-molecule, property-by-property
	foreach r $resn {
	    lappend s "\"$r\":\{"
	    foreach p $props {
		upvar 0 ::CGtools::map([list $p $r]) values

                if {![info exists values]} {continue}

		## Since fields contain nested lists and different
		## data types, we break them down here...
		switch $p {
		    type -
		    name {
			lappend s "[string2json $p]:[sublist2json_str $values],"
		    }
		    charge -
                    atomicnumber -
		    mass {
			lappend s "[string2json $p]:[list2json_num $values],"
		    }

		    segname -
                    map -
		    bonds -
		    angles -
                    dihedrals {;# Nested Lists
			lappend s "[string2json $p]:"
			lappend s "[sublist2json_str $values],"
		    }
		    
		    default {continue}
		}

	    }
	    lset s end [string trimright [lindex $s end] ","]
	    lappend s "\},"
	}
    }

    ## Replace last brace {
    lset s end "  }\n\}\n}"

    ## Do a global string replace for "segname", change it to "map"
    ## This is a legacy CGtools thing that isn't necessary anymore 
    set s [string map {segname map} $s]

    puts stdout [join $s "\n"]
}

proc sublist2json_str {listVal} {
    set s {}
    foreach l $listVal {
	if {[isatomic $l]} {
	    lappend s "[string2json $l]"
	} else {
	    lappend s "[sublist2json_str $l]"
	}
    }
    lset s end [string trimright [lindex $s end] ","]
    return [list2json_num $s]
}

proc list2json_str {listVal} {
    return "\[\"[join $listVal [string2json ,]]\"\]"
}

proc list2json_num {listVal} {
    return "\[[join $listVal ,]\]"
}

proc string2json {str} {
    return "\"$str\""
}

proc isatomic {list} {string equal $list [lindex $list 0]}

if {1} {map2json {*}$argv}
