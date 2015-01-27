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

## Values double checked CMM 20MAR2014

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

proc ::CGtools::map_protein {} {

    variable map

    ### BEADS
    ## Taken from legacy/map_to_cg.perl (Russel)
    ## Backbone first, then sidechains
    ## Atom names from FG model to beads
    ## This currently omits hydrogens

    set keyword segname
    set map([list $keyword GLY]) {CA}
    set map([list $keyword ALA]) {CA}
    set map([list $keyword VAL]) {{CA} {CB CG1 CG2}}
    set map([list $keyword LEU]) {{CA} {CB CD1 CD2 CG}}
    set map([list $keyword ILE]) {{CA} {CB CD CG1 CG2}}
    set map([list $keyword PRO]) {{CA} {CB CD CG}}
    set map([list $keyword MET]) {{CA} {CB CG SD CE}}
    set map([list $keyword PHE]) {{CA} {CB CG} {CE1 CD1} CZ {CD2 CE2}}
    set map([list $keyword TRP]) {{CA} {CB CG CD1} {CD2 CE3 CZ3} {CH2 CZ2 CE2 NE1}}
    set map([list $keyword SER]) {{CA} {CB OG}}
    set map([list $keyword THR]) {{CA} {CG CG2 OG1}}
    set map([list $keyword CYS]) {{CA} {CB SG}}
    set map([list $keyword ASN]) {{CA} {CB CG ND2 OD1}}
    set map([list $keyword GLN]) {{CA} {CB CD CG NE2 OE1}}
    set map([list $keyword TYR]) {{CA} {CB CG} {CD1 CE1} {CZ OH} {CD2 CE2}}
    set map([list $keyword ASP]) {{CA} {CB CG OD1 OD2}}
    set map([list $keyword GLU]) {{CA} {CB CD CG OE1 OE2}}
    set map([list $keyword LYS]) {{CA} {CB CD CG} {CE NZ}}
    set map([list $keyword ARG]) {{CA} {CB CD CG} {CZ NE NH1 NH2}}
    set map([list $keyword HIS]) {{CA} {CB CG} {CD2 NE2} {ND1 CE1}}
    set map([list $keyword HSP]) $map([list $keyword HIS])
    set map([list $keyword HSD]) $map([list $keyword HIS])
    set map([list $keyword HSE]) $map([list $keyword HIS])

    ### TYPES
    ## Taken from legacy/gen_top.perl (Russel)
    ## Backbone type first, then sidechain types in order
    ## supplied in res_map
    set keyword type
    set map([list $keyword GLY]) {GBB}
    set map([list $keyword ALA]) {ABB}
    set map([list $keyword VAL]) {GB3 VAL}
    set map([list $keyword LEU]) {GB3 LEU}
    set map([list $keyword ILE]) {GB3 ILE}
    set map([list $keyword PRO]) {GBB PRO}
    set map([list $keyword MET]) {GB2 MET}
    set map([list $keyword PHE]) {GB4 XYR BER BER BER}
    set map([list $keyword TRP]) {GB1 TR1 TR2 TR3}
    set map([list $keyword SER]) {GB1 SER}
    set map([list $keyword THR]) {GB1 THR}
    set map([list $keyword CYS]) {GB3 CYS}
    set map([list $keyword ASN]) {GB1 ASN}
    set map([list $keyword GLN]) {GB1 GLN}
    set map([list $keyword TYR]) {GBB XYR BER PHR BER}
    set map([list $keyword ASP]) {GB1 ASP}
    set map([list $keyword GLU]) {GB1 GLU}
    set map([list $keyword LYS]) {GB1 LY1 LY2}
    set map([list $keyword ARG]) {GB1 AR1 AR2}
    set map([list $keyword HIS]) {GB1 HI1 HI2 HI3}
    set map([list $keyword HSP]) $map([list $keyword HIS])
    set map([list $keyword HSD]) {GBB HI1 HI2 HI3}
    set map([list $keyword HSE]) $map([list $keyword HSD])

    ### NAMES
    set keyword name
    set map([list $keyword GLY]) {GBB}
    set map([list $keyword ALA]) {ABB}
    set map([list $keyword VAL]) {GB3 VAL}
    set map([list $keyword LEU]) {GB3 LEU}
    set map([list $keyword ILE]) {GB3 ILE}
    set map([list $keyword PRO]) {GBB PRO}
    set map([list $keyword MET]) {GB2 MET}
    set map([list $keyword PHE]) {GB4 PH1 PH2 PH3 PH4}
    set map([list $keyword TRP]) {GB1 TR1 TR2 TR3}
    set map([list $keyword SER]) {GB1 SER}
    set map([list $keyword THR]) {GB1 THR}
    set map([list $keyword CYS]) {GB3 CYS}
    set map([list $keyword ASN]) {GB1 ASN}
    set map([list $keyword GLN]) {GB1 GLN}
    set map([list $keyword TYR]) {GBB TY1 TY2 TY3 TY4}
    set map([list $keyword ASP]) {GB1 ASP}
    set map([list $keyword GLU]) {GB1 GLU}
    set map([list $keyword LYS]) {GB1 LY1 LY2}
    set map([list $keyword ARG]) {GB1 AR1 AR2}
    set map([list $keyword HIS]) {GB1 HI1 HI2 HI3}
    set map([list $keyword HSP]) $map([list $keyword HIS])
    set map([list $keyword HSD]) {GBB HI1 HI2 HI3}
    set map([list $keyword HSE]) $map([list $keyword HSD])

    ## CHARGES
    ## Taken from legacy/gen_top.perl (Russel)
    set keyword charge
    set map([list $keyword GLY]) {0.0}
    set map([list $keyword ALA]) {0.0}
    set map([list $keyword VAL]) {0.0 0.0}
    set map([list $keyword LEU]) {0.0 0.0}
    set map([list $keyword ILE]) {0.0 0.0}
    set map([list $keyword PRO]) {0.0 0.0}
    set map([list $keyword MET]) {0.0 0.0}
    set map([list $keyword PHE]) {0.0 0.0 0.0 0.0 0.0}
    set map([list $keyword TRP]) {0.0 0.0 0.0 0.0}
    set map([list $keyword SER]) {0.0 0.0}
    set map([list $keyword THR]) {0.0 0.0}
    set map([list $keyword CYS]) {0.0 0.0}
    set map([list $keyword ASN]) {0.0 0.0}
    set map([list $keyword GLN]) {0.0 0.0}
    set map([list $keyword TYR]) {0.0 0.0 0.0 0.0 0.0}
    set map([list $keyword ASP]) {0.0 -0.1118}
    set map([list $keyword GLU]) {0.0 -0.1118}
    set map([list $keyword LYS]) {0.0 0.0 0.1118}
    set map([list $keyword ARG]) {0.0 0.0 0.1118}
    set map([list $keyword HIS]) {0.0 0.0 0.0 0.0}
    set map([list $keyword HSP]) $map([list $keyword HIS])
    set map([list $keyword HSD]) $map([list $keyword HIS])
    set map([list $keyword HSE]) $map([list $keyword HIS])

    ## MASSES
    ## Taken from legacy/gen_top.perl (Russel)
    set keyword mass
    set map([list $keyword GLY]) {54.0279989243}
    set map([list $keyword ALA]) {71.0789986849}
    set map([list $keyword VAL]) {54.0279989243 43.0889991522}
    set map([list $keyword LEU]) {54.0279989243 57.1159988642}
    set map([list $keyword ILE]) {54.0279989243 57.1159988642}
    set map([list $keyword PRO]) {54.0279989243 42.080999136}
    set map([list $keyword MET]) {54.0279989243 75.1490005255}
    set map([list $keyword PHE]) {54.0279989243 23.035 23.035 23.035 23.035}
    set map([list $keyword TRP]) {54.0279989243 39.0569990874 92.1209981443 75.0899981262}
    set map([list $keyword SER]) {54.0279989243 31.0339993238}
    set map([list $keyword THR]) {54.0279989243 45.0609990358}
    set map([list $keyword CYS]) {54.0279989243 47.0950011015}
    set map([list $keyword ASN]) {54.0279989243 58.0599989891}
    set map([list $keyword GLN]) {54.0279989243 72.0869987011}
    set map([list $keyword TYR]) {54.0279989243 23.035 23.035 39.065 23.035}
    set map([list $keyword ASP]) {54.0279989243 58.0359985828}
    set map([list $keyword GLU]) {54.0279989243 72.0629982948}
    set map([list $keyword LYS]) {54.0279989243 42.080999136 31.0579997301 }
    set map([list $keyword ARG]) {54.0279989243 42.080999136 59.0719996691 }
    set map([list $keyword HIS]) {54.0279989243 26.038 28.00 28.00}
    set map([list $keyword HSP]) $map([list $keyword HIS])
    set map([list $keyword HSD]) $map([list $keyword HIS])
    set map([list $keyword HSE]) $map([list $keyword HIS])

    set map([list bonds GLY]) { {none} }
    set map([list bonds ALA]) { {none} }
    set map([list bonds VAL]) { {GB3 VAL} }
    set map([list bonds LEU]) { {GB3 LEU} }
    set map([list bonds ILE]) { {GB3 ILE} }
    set map([list bonds PRO]) { {GBB PRO} }
    set map([list bonds MET]) { {GB2 MET} }
    set map([list bonds PHE]) { {GB4 PH1} {PH1 PH2} {PH2 PH3} {PH3 PH4} {PH4 PH1} }
    set map([list bonds TRP]) { {GB1 TR1} {TR1 TR2} {TR1 TR3} {TR2 TR3} }
    set map([list bonds SER]) { {GB1 SER} }
    set map([list bonds THR]) { {GB1 THR} }
    set map([list bonds CYS]) { {GB3 CYS} }
    set map([list bonds ASN]) { {GB1 ASN} }
    set map([list bonds GLN]) { {GB1 GLN} }
    set map([list bonds TYR]) { {GBB TY1} {TY1 TY2} {TY2 TY3} {TY3 TY4} {TY4 TY1} }
    set map([list bonds ASP]) { {GB1 ASP} }
    set map([list bonds GLU]) { {GB1 GLU} }
    set map([list bonds LYS]) { {GB1 LY1} {LY1 LY2} }
    set map([list bonds ARG]) { {GB1 AR1} {AR1 AR2} }
    set map([list bonds HIS]) { {GB1 HI1} {HI1 HI2} {HI1 HI3} {HI2 HI3} }
    set map([list bonds HSP]) $map([list bonds HIS])
    set map([list bonds HSD]) { {GBB HI1} {HI1 HI2} {HI1 HI3} {HI2 HI3} }
    set map([list bonds HSE]) $map([list bonds HSD])

    set map([list angles GLY]) { {none} }
    set map([list angles ALA]) { {none} }
    set map([list angles VAL]) { {none} }
    set map([list angles LEU]) { {none} }
    set map([list angles ILE]) { {none} }
    set map([list angles PRO]) { {none} }
    set map([list angles MET]) { {none} }
    set map([list angles PHE]) { {auto} }
    set map([list angles TRP]) { {auto} }
    set map([list angles SER]) { {none} }
    set map([list angles THR]) { {none} }
    set map([list angles CYS]) { {none} }
    set map([list angles ASN]) { {none} }
    set map([list angles GLN]) { {none} }
    set map([list angles TYR]) { {auto} }
    set map([list angles ASP]) { {none} }
    set map([list angles GLU]) { {none} }
    set map([list angles LYS]) { {GB1 LY1 LY2} }
    set map([list angles ARG]) { {GB1 AR1 AR2} }
    set map([list angles HIS]) { {auto} }
    set map([list angles HSP]) $map([list angles HIS])
    set map([list angles HSD]) { {auto} }
    set map([list angles HSE]) $map([list angles HSD])

    return
}

::CGtools::map_protein

if { $::CGtools::maptest } {

  foreach r {GLY ALA VAL LEU ILE PRO MET PHE TRP SER THR CYS \
    ASN GLN TYR ASP GLU LYS ARG HIS HSP HSD HSE} {

        puts "Checking $r ..."

       ::CGtools::map_stats $r
       ::CGtools::checkbonds $r
       ::CGtools::checkangles $r
     }
}
