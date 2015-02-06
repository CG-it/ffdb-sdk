if { 1 } { 

    # run this on an AA system to get a Tcl file that contains CG atomic numbers

    package require cg

    set hydrogen [atomselect top "hydrogen"]
    ${hydrogen} set "atomicnumber" 1.0
    ${hydrogen} set "element" "H"
    ${hydrogen} delete

    set carbon [atomselect top "carbon"]
    ${carbon} set "atomicnumber" 6.0
    ${carbon} set "element" "C"
    ${carbon} delete

    set nitrogen [atomselect top "nitrogen"]
    ${nitrogen} set "atomicnumber" 7.0
    ${nitrogen} set "element" "N"
    ${nitrogen} delete

    set oxygen [atomselect top "oxygen"]
    ${oxygen} set "atomicnumber" 8.0
    ${oxygen} set "element" "O"
    ${oxygen} delete

    set sodium [atomselect top "resname SOD"]
    ${sodium} set "atomicnumber" 11.0
    ${sodium} set "element" "Na"
    ${sodium} delete

    set phosphorus [atomselect top "name P"]
    ${phosphorus} set "atomicnumber" 15.0
    ${phosphorus} set "element" "P"
    ${phosphorus} delete

    set chloride [atomselect top "resname CLA"]
    ${chloride} set "atomicnumber" 17.0
    ${chloride} set "element" "Cl"
    ${chloride} delete

    set potassium [atomselect top "resname POT"]
    ${potassium} set "atomicnumber" 19.0
    ${potassium} set "element" "K"
    ${potassium} delete


    set all [atomselect top "all and not (resname POT SOD CLA)"]

    set an [lsort -unique -integer [${all} get "atomicnumber"]]
    if { [lindex ${an} 0] == 0 } {
        puts stderr "Error: some atoms have undefined atomic number"
        quit
    }

    set resnames [lsort -unique [${all} get resname]]

    set output [open "atomic_numbers.tcl" "w"]

    foreach resname ${resnames} {
        set resname_sel [atomselect top "resname ${resname}"]
        set residues [lsort -unique [${resname_sel} get residue]]
        set first_residue [lindex ${residues} 0]
        ${resname_sel} delete

        dict set ::CGtools::map ${resname} atomicnumber [list]
        foreach \
            cg_atom_name  [dict get $::CGtools::map ${resname} name] \
            aa_atom_names [dict get $::CGtools::map ${resname} map] {
            set aa_atoms [atomselect top "resname ${resname} and residue ${first_residue} and name ${aa_atom_names}"]
            if { [${aa_atoms} num] == 0 } {
                puts stderr "Error: selection ([${aa_atoms} text]) has no atoms\n"
                break
            }
            # TODO: fix this for cases where the plain sum may not work (e.g. benzyl rings)
            set atomicnumbers [${aa_atoms} get atomicnumber]
            ${aa_atoms} delete
            set atomicnumber [vecsum ${atomicnumbers}]
            if { (${resname} == "TIP3") || (${resname} == "TIP3") } {
                set atomicnumber 30
            }
            lappend ::CGtools::map([list atomicnumber ${resname}]) [expr int(${atomicnumber})]
        }

        puts ${output} "    dict set ::CGtools::map ${resname} atomicnumber {" 
        foreach name [dict get $::CGtools::map ${resname} name] \
            z [dict get $::CGtools::map ${resname} atomicnumber] {
                puts ${output} "        $z"
            }
        puts ${output} "    }"
        puts ${output} ""
    }

    close ${output}

}

