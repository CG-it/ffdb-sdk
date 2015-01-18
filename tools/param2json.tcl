#!/usr/bin/tclsh8.5
## Converts the plain-text parameter files (param_*.dat)
## to verified json. You can check the output with
## http://jsonformatter.curiousconcept.com/

#./cvt2json file1 file2 file3 ...

## Main command
proc param2json {args} {

    set s {}
    lappend s "{"
    lappend s "\"fftype\":\"sdk\","
    lappend s "\"params\":\["

    foreach f $args {

	## Slurp up the file
	set data [read [set fid [open $f]]][close $fid]

	foreach l [split $data "\n"] {
	    switch -glob $l {
		"bond*"      {bond2json  $l s}
		"angle*"     {angle2json $l s}
		"dihedral*"  {dihed2json $l s}
		"pair*"      {pair2json  $l s}
		"#*"         {continue}
		default      {continue}
	    }
	}
    }

    ## Replace last brace {
    lset s end "  }\n\]\n}"
    puts stdout [join $s "\n"]
}

proc bond2json {line jsonstr} {

    upvar $jsonstr s

    #"bond":{
    #   "param":"bond",
    #   "types":["C2T","CM2"],
    #   "potential":"harmonic",
    #   "k":110.00,
    #   "r0": 2.54,
    #   "comment":""
    #}
    
    lassign $line param atype1 atype2 potential k r0 comment
    lappend s "  {"
    lappend s "    \"param\":\"bond\","
    lappend s "    \"types\":\[\"$atype1\",\"$atype2\"\],"
    lappend s "    \"potential\":\"$potential\","
    lappend s "    \"k\":$k,"
    lappend s "    \"r0\":$r0,"
    lappend s "    \"comment\":\"$comment\""
    lappend s "  },"
}

proc angle2json {line jsonstr} {

    upvar $jsonstr s

    #{
    #   "param":"angle",
    #   "types":["C2T","CM2", "CTB"],
    #   "potential":"sdk",
    #   "k":110.00,
    #   "theta0": 2.54,
    #   "comment":""
    #}

    lassign $line param atype1 atype2 atype3\
	potential k theta0 comment

    lappend s "  {"
    lappend s "    \"param\":\"angle\","
    lappend s "    \"types\":\[\"$atype1\",\"$atype2\",\"$atype3\"\],"
    lappend s "    \"potential\":\"$potential\","
    lappend s "    \"k\":$k,"
    lappend s "    \"theta0\":$theta0,"
    lappend s "    \"comment\":\"$comment\""
    lappend s "  },"
}

proc dihed2json {line jsonstr} {

    upvar $jsonstr s

    #{
    #   "param":"dihedral",
    #   "types":["CM2R","CM2R","CM2R",CM2R"],
    #   "potential":"harmonic",
    #   "k":30.0,
    #   "chi0": 180.0,
    #   "comment":""
    #}

    lassign $line param atype1 atype2 atype3 atype4\
	potential k chi0 comment

    lappend s "  {"
    lappend s "    \"param\":\"dihedral\","
    lappend s "    \"types\":\[\"$atype1\",\"$atype2\",\"$atype3\",\"$atype4\"\],"
    lappend s "    \"potential\":\"$potential\","
    lappend s "    \"k\":$k,"
    lappend s "    \"chi0\":$chi0,"
    lappend s "    \"comment\":\"$comment\""
    lappend s "  },"
}

proc pair2json {line jsonstr} {

    upvar $jsonstr s

    #{
    #   "param":"pair",
    #   "types":["CM2R","CM2R"],
    #   "potential":"lj9_6",
    #   "epsilon":0.1800,
    #   "sigma": 3.9743,
    #   "comment":""
    #}

    lassign $line param atype1 atype2\
	potential epsilon sigma comment

    lappend s "  {"
    lappend s "    \"param\":\"pair\","
    lappend s "    \"types\":\[\"$atype1\",\"$atype2\"\],"
    lappend s "    \"potential\":\"$potential\","
    lappend s "    \"epsilon\":$epsilon,"
    lappend s "    \"sigma\":$sigma,"
    lappend s "    \"comment\":\"$comment\""
    lappend s "  },"
}

if {1} {param2json {*}$argv}
