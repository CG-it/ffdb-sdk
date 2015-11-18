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

proc ::CGtools::map_ceramide {} {

    variable map

    # +------+
    # | CER1 |
    # +------+

    set map([list map CER1]) {
        {O1 HO1 C1 HA HB}
        {C2 HS N21 HN}
        {C3 HX O3 HO}
        {C34 H4X C35 H5X}
        {C36 H6X H6Y H14S C37 H7X H7Y C38 H8X H8Y}
        {C39 H9X H9Y C310 H10X H10Y C311 H11X H11Y}
        {C312 H12X H12Y C313 H13X H13Y C314 H14X H14Y}
        {C315 H15X H15Y C316 H16X H16Y}
        {C317 H17X H17Y C318 H18X H18Y H18Z}
        {C21 O22}
        {C22 H2R H2S C23 H3R H3S C24 H4R H4S}
        {C25 H5R H5S C26 H6R H6S C27 H7R H7S}
        {C28 H8R H8S C29 H9R H9S C210 H10R H10S}
        {C211 H11R H11S C212 H12R H12S C213 H13R H13S}
        {C214 H14R C215 H15R H15S C216 H16R H16S}
        {C217 H17R H17S C218 H18R H18S C219 H19R H19S}
        {C220 H20R H20S C221 H21R H21S C222 H22R H22S}
        {C223 H23R H23S C224 H24R H24S C225 H25R H25S}
        {C226 H26R H26S C227 H27R H27S C228 H28R H28S}
        {C229 H29R H29S C230 H30R H30S}
        {C232 H32R H32S C231 OM O}
        {C233 H33R H33S C234 H34R H34S C235 H35R H35S}
        {C236 H36R H36S C237 H37R H37S C238 H38R H38S}
        {C239 H39R C240 H40R C241 H41R H41S}
        {C242 H42R C243 H43R}
        {C244 H44R H44S C245 H45R H45S C246 H46R H46S}
        {C247 H47R H47S C248 H48R H48S H48T}
    }

    set map([list type CER1])    {
        SER 
        N
        SER
        CMD2
        CM
        CM
        CM
        CM2
        CT2
        O
        CM
        CM
        CM
        CM
        CM
        CM
        CM
        CM
        CM
        CM2
        EST1
        CM
        CM
        CMD3
        CMD2
        CM
        CT2
    }

    set map([list name CER1])    {
        OH1
        N
        OH2
        CS3
        CS4
        CS5
        CS6
        CS7
        CS8
        OA1
        CA2
        CA3
        CA4
        CA5
        CA6
        CA7
        CA8
        CA9
        CA10
        CA11
        OA12
        CA13
        CA14
        CA15
        CA16
        CA17
        CA18
    }

    set map([list charge CER1])  {
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
        0.0
        0.0
        0.0
    }

    set map([list mass CER1])    {
       31.0344
       28.0340
       30.0264
       26.0380
       43.0890
       42.0810
       42.0810
       28.0540
       29.0620
       28.0100
       42.0810
       42.0810
       42.0810
       42.0810
       41.0730
       42.0810
       42.0810
       42.0810
       42.0810
       28.0540
       58.0368
       42.0810
       42.0810
       40.0650
       26.0380
       42.0810
       29.0620
  }

    set map([list bonds CER1]) {
         {OH1 N} {OH2 N} {OH2 CS3}
         {CS3 CS4} {CS4 CS5} {CS5 CS6}
         {CS6 CS7} {CS7 CS8} {N OA1}
         {OA1 CA2} {CA2 CA3} {CA3 CA4} {CA4 CA5}
         {CA5 CA6} {CA6 CA7} {CA7 CA8}
         {CA8 CA9} {CA9 CA10} {CA10 CA11}
         {CA11 OA12} {OA12 CA13} {CA13 CA14}
         {CA14 CA15} {CA15 CA16} {CA16 CA17}
         {CA17 CA18}
    }

    set map([list angles CER1]) {
        {auto}
    }

    set map([list atomicnumber CER1]) {
        17
        15
        16
        14
        25
        24
        24
        16
        17
        14
        24
        24
        24
        24
        23
        24
        24
        24
        24
        16
        30
        24
        24
        22
        14
        24
        17
    }

    ##CER482
    set map([list map CER482]) {
	{O1 HO1 C1S H1S H1T}
	{C2S H2S NF HNF}
	{C3S H3S O3 HO3}
	{C4S H4S C5S H5S}
	{C6S H6S H6T C7S H7S H7T C8S H8S H8T}
	{C9S H9S H9T C10S H10S H10T C11S H11S H11T}
	{C12S H12S H12T C13S H13S H13T C14S H14S H14T}
	{C15S H15S H15T C16S H16S H16T}
	{C17S H17S H17T C18S H18S H18T H18U}
	{C1F OF}
	{C2F H2F H2G C3F H3F H3G C4F H4F H4G}
	{C5F H5F H5G C6F H6F H6G C7F H7F H7G}
	{C8F H8F H8G C9F H9F H9G C10F H10F H10G}
	{C11F H11F H11G C12F H12F H12G C13F H13F H13G}
	{C14F H14F H14G C15F H15F H15G C16F H16F H16G}
	{C17F H17F H17G C18F H18F H18G C19F H19F H19G}
	{C20F H20F H20G C21F H21F H21G C22F H22F H22G}
	{C23F H23F H23G C24F H24F H24G C25F H25F H25G}
	{C26F H26F H26G C27F H27F H27G C28F H28F H28G}
	{C29F H29F H29G C30F H30F H30G}
	{C31F O30F O31F C32F H32F H32G}	
	{C33F H33F H33G C34F H34F H34G C35F H35F H35G}
	{C36F H36F H36G C37F H37F H37G C38F H38F H38G}
	{C39F H39F C40F H40F C41F H41F H41G}
	{C42F H42F C43F H43F}
	{C44F H44F H44G C45F H45F H45G C46F H46F H46G}
	{C47F H47F H47G C48F H48F H48G H48H}
    }

    set map([list type CER482])    {
	SER 
	N
	SER
	CMD2
	CM
	CM
	CM
	CM2
	CT2
	O
	CM
	CM
	CM
	CM
	CM
	CM
	CM
	CM
	CM
	CM2
	EST1
	CM
	CM
	CMD3
	CMD2
	CM
	CT2
    }

    set map([list name CER482])    {
	OH1
	N
	OH2
	CS3
	CS4
	CS5
	CS6
	CS7
	CS8
	OF1
	CF2
	CF3
	CF4
	CF5
	CF6
	CF7
	CF8
	CF9
	CF10
	CF11
	OF12
	CF13
	CF14
	CF15
	CF16
	CF17
	CF18
    }

    set map([list charge CER482])  {
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
	0.0
	0.0
	0.0
    }

    set map([list mass CER482])    {
	31.0344
	28.0340
	30.0264
	26.0380
	43.0890
	42.0810
	42.0810
	28.0540
	29.0620
	28.0100
	42.0810
	42.0810
	42.0810
	42.0810
	41.0730
	42.0810
	42.0810
	42.0810
	42.0810
	28.0540
	58.0368
	42.0810
	42.0810
	40.0650
	26.0380
	42.0810
	29.0620
    }

    set map([list bonds CER482]) {
	{OH1 N} {OH2 N} {OH2 CS3}
	{CS3 CS4} {CS4 CS5} {CS5 CS6}
	{CS6 CS7} {CS7 CS8} {N OF1}
	{OF1 CF2} {CF2 CF3} {CF3 CF4} {CF4 CF5}
	{CF5 CF6} {CF6 CF7} {CF7 CF8}
	{CF8 CF9} {CF9 CF10} {CF10 CF11}
	{CF11 OF12} {OF12 CF13} {CF13 CF14}
	{CF14 CF15} {CF15 CF16} {CF16 CF17}
	{CF17 CF18}
    }

    set map([list angles CER482]) {
	{auto}
    }

    set map([list atomicnumber CER482]) {
	17
	15
	16
	14
	25
	24
	24
	16
	17
	14
	24
	24
	24
	24
	23
	24
	24
	24
	24
	16
	30
	24
	24
	22
	14
	24
	17
    }


    # +------+
    # | CER2 |
    # +------+

    set map([list map CER2]) {
      {O1 HO1 C1 HA HB}
      {C2 HS N21 HN}
      {C3 HX O3 HO}
      {C34 H4X C35 H5X}
      {C36 H6X H6Y C37 H7X H7Y C38 H8X H8Y}
      {C39 H9X H9Y C310 H10X H10Y C311 H11X H11Y}
      {C312 H12X H12Y C313 H13X H13Y C314 H14X H14Y}
      {C315 H15X H15Y C316 H16X H16Y}
      {C317 H17X H17Y C318 H18X H18Y H18Z}
      {C21 O22}
      {C22 H2R H2S C23 H3R H3S C24 H4R H4S}
      {C25 H5R H5S C26 H6R H6S C27 H7R H7S}
      {C28 H8R H8S C29 H9R H9S C210 H10R H10S}
      {C211 H11R H11S C212 H12R H12S C213 H13R H13S}
      {C214 H14R H14S C215 H15R H15S C216 H16R H16S}
      {C217 H17R H17S C218 H18R H18S C219 H19R H19S}
      {C220 H20R H20S C221 H21R H21S C222 H22R H22S}
      {C223 H23R H23S C224 H24R H24S H24T}
    }

    set map([list type CER2])    {
	SER 
	N
	SER
	CMD2
	CM
	CM
	CM
	CM2
	CT2
	O
	CM
	CM
	CM
	CM
	CM
	CM
	CM
	CT2
    }

    set map([list name CER2])    {
	OH1
	N
	OH2
	CS3
	CS4
	CS5
	CS6
	CS7
	CS8
	OA1
	CA2
	CA3
	CA4
	CA5
	CA6
	CA7
	CA8
	CA9
    }

    set map([list charge CER2])  {
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
	0.0
	0.0
	0.0
	0.0
	0.0
	0.0
    }

    set map([list mass CER2])    {
	31.0344
	28.0340
	30.0264
	26.0380
	42.0810
	42.0810
	42.0810
	28.0540
	29.0620
	28.0100
	42.0810
	42.0810
	42.0810
	42.0810
	42.0810
	42.0810
	42.0810
	29.0620
    }

    set map([list bonds CER2]) {
	{OH1 N} {OH2 N} {OH2 CS3}
	{CS3 CS4} {CS4 CS5} {CS5 CS6}
	{CS6 CS7} {CS7 CS8} {N OA1}
	{OA1 CA2} {CA2 CA3} {CA3 CA4} {CA4 CA5}
	{CA5 CA6} {CA6 CA7} {CA7 CA8}
	{CA8 CA9}
    }

    set map([list angles CER2]) {
	{auto}
    }

    set map([list atomicnumber CER2]) {
	17
	15
	16
	14
	24
	24
	24
	16
	17
	14
	24
	24
	24
	24
	24
	24
	24
	17
    }

    ##CER240    
    set map([list map CER240]) {
	{O1 HO1 C1S H1S H1T}
	{C2S H2S NF HNF}
	{C3S H3S O3 HO3}
	{C4S H4S C5S H5S}
	{C6S H6S H6T C7S H7S H7T C8S H8S H8T}
	{C9S H9S H9T C10S H10S H10T C11S H11S H11T}
	{C12S H12S H12T C13S H13S H13T C14S H14S H14T}
	{C15S H15S H15T C16S H16S H16T}
	{C17S H17S H17T C18S H18S H18T H18U}
	{C1F OF}
	{C2F H2F H2G C3F H3F H3G C4F H4F H4G}
	{C5F H5F H5G C6F H6F H6G C7F H7F H7G}
	{C8F H8F H8G C9F H9F H9G C10F H10F H10G}
	{C11F H11F H11G C12F H12F H12G C13F H13F H13G}
	{C14F H14F H14G C15F H15F H15G C16F H16F H16G}
	{C17F H17F H17G C18F H18F H18G C19F H19F H19G}
	{C20F H20F H20G C21F H21F H21G C22F H22F H22G}
	{C23F H23F H23G C24F H24F H24G H24H}	
    }

    set map([list type CER240])    {
	SER 
	N
	SER
	CMD2
	CM
	CM
	CM
	CM2
        CT2
        O
        CM
        CM
        CM
        CM
        CM
        CM
        CM
        CT2
    }

    set map([list name CER240])    {
        OH1
        N
        OH2
        CS3
        CS4
        CS5
        CS6
        CS7
        CS8
        OF1
        CF2
        CF3
        CF4
        CF5
        CF6
        CF7
        CF8
        CF9
    }

    set map([list charge CER240])  {
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
        0.0
        0.0
        0.0
        0.0
        0.0
        0.0
    }

    set map([list mass CER240])    {
	31.0344
	28.0340
	30.0264
	26.0380
	42.0810
	42.0810
	42.0810
	28.0540
	29.0620
	28.0100
	42.0810
	42.0810
	42.0810
	42.0810
	42.0810
	42.0810
	42.0810
	29.0620
    }

    set map([list bonds CER240]) {
	{OH1 N} {OH2 N} {OH2 CS3}
	{CS3 CS4} {CS4 CS5} {CS5 CS6}
	{CS6 CS7} {CS7 CS8} {N OF1}
	{OF1 CF2} {CF2 CF3} {CF3 CF4} {CF4 CF5}
	{CF5 CF6} {CF6 CF7} {CF7 CF8}
	{CF8 CF9}
    }

    set map([list angles CER240]) {
        {auto}
    }

    set map([list atomicnumber CER240]) {
        17
        15
        16
        14
        24
        24
        24
        16
        17
        14
        24
        24
        24
        24
        24
        24
        24
        17
    }
 
    ##CER241    
    set map([list map CER241]) {
	{O1 HO1 C1S H1S H1T}
	{C2S H2S NF HNF}
	{C3S H3S O3 HO3}
	{C4S H4S C5S H5S}
	{C6S H6S H6T C7S H7S H7T C8S H8S H8T}
	{C9S H9S H9T C10S H10S H10T C11S H11S H11T}
	{C12S H12S H12T C13S H13S H13T C14S H14S H14T}
	{C15S H15S H15T C16S H16S H16T}
	{C17S H17S H17T C18S H18S H18T H18U}
	{C1F OF}
	{C2F H2F H2G C3F H3F H3G C4F H4F H4G}
        {C5F H5F H5G C6F H6F H6G C7F H7F H7G}
	{C8F H8F H8G C9F H9F H9G C10F H10F H10G}
	{C11F H11F H11G C12F H12F H12G C13F H13F H13G}
	{C14F H14F H14G C15F H15F C16F H16F}
	{C17F H17F H17G C18F H18F H18G C19F H19F H19G}
	{C20F H20F H20G C21F H21F H21G C22F H22F H22G}
	{C23F H23F H23G C24F H24F H24G H24H}	
    }

    set map([list type CER241])    {
	SER 
	N
	SER
	CMD2
	CM
	CM
	CM
	CM2
        CT2
        O
        CM
        CM
        CM
        CM
        CMD3
        CM
        CM
        CT2
    }

    set map([list name CER241])    {
        OH1
        N
        OH2
        CS3
        CS4
        CS5
        CS6
        CS7
        CS8
        OF1
        CF2
        CF3
        CF4
        CF5
        CF6
        CF7
        CF8
        CF9
    }

    set map([list charge CER241])  {
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
        0.0
        0.0
        0.0
        0.0
        0.0
        0.0
    }

    set map([list mass CER241])    {
	31.0344
	28.0340
	30.0264
	26.0380
	42.0810
	42.0810
	42.0810
	28.0540
	29.0620
	28.0100
	42.0810
	42.0810
	42.0810
	42.0810
	40.0650
	42.0810
	42.0810
	29.0620
    }

    set map([list bonds CER241]) {
	{OH1 N} {OH2 N} {OH2 CS3}
	{CS3 CS4} {CS4 CS5} {CS5 CS6}
	{CS6 CS7} {CS7 CS8} {N OF1}
	{OF1 CF2} {CF2 CF3} {CF3 CF4} {CF4 CF5}
	{CF5 CF6} {CF6 CF7} {CF7 CF8}
	{CF8 CF9}
    }

    set map([list angles CER241]) {
        {auto}
    }

    set map([list atomicnumber CER241]) {
        17
        15
        16
        14
        24
        24
        24
        16
        17
        14
        24
        24
        24
        24
        22
        24
        24
        17
    }
   
    ##CER160    
    set map([list map CER160]) {
	{O1 HO1 C1S H1S H1T}
	{C2S H2S NF HNF}
	{C3S H3S O3 HO3}
	{C4S H4S C5S H5S}
	{C6S H6S H6T C7S H7S H7T C8S H8S H8T}
	{C9S H9S H9T C10S H10S H10T C11S H11S H11T}
	{C12S H12S H12T C13S H13S H13T C14S H14S H14T}
	{C15S H15S H15T C16S H16S H16T}
	{C17S H17S H17T C18S H18S H18T H18U}
	{C1F OF}
	{C2F H2F H2G C3F H3F H3G C4F H4F H4G}
	{C5F H5F H5G C6F H6F H6G C7F H7F H7G}
	{C8F H8F H8G C9F H9F H9G C10F H10F H10G}
	{C11F H11F H11G C12F H12F H12G C13F H13F H13G}
	{C14F H14F H14G C15F H15F H15G C16F H16F H16G H16H}
    }

    set map([list type CER160])    {
	SER 
	N
	SER
	CMD2
	CM
	CM
	CM
	CM2
        CT2
        O
        CM
        CM
        CM
        CM
        CT
    }

    set map([list name CER160])    {
        OH1
        N
        OH2
        CS3
        CS4
        CS5
        CS6
        CS7
        CS8
        OF1
        CF2
        CF3
        CF4
        CF5
	CF6
    }

    set map([list charge CER160])  {
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
        0.0
        0.0
	0.0
    }

    set map([list mass CER160])    {
	31.0344
	28.0340
	30.0264
	26.0380
	42.0810
	42.0810
	42.0810
	28.0540
	29.0620
	28.0100
	42.0810
	42.0810
	42.0810
	42.0810
	43.0810
    }

    set map([list bonds CER160]) {
	{OH1 N} {OH2 N} {OH2 CS3}
	{CS3 CS4} {CS4 CS5} {CS5 CS6}
	{CS6 CS7} {CS7 CS8} {N OF1}
	{OF1 CF2} {CF2 CF3} {CF3 CF4} {CF4 CF5}
	{CF5 CF6}
    }

    set map([list angles CER160]) {
	{auto}
    }

    set map([list atomicnumber CER160]) {
	17
	15
	16
	14
	24
	24
	24
	16
	17
	14
	24
	24
	24
	24
	25
    }

    ##CER180    
    set map([list map CER180]) {
	{O1 HO1 C1S H1S H1T}
	{C2S H2S NF HNF}
	{C3S H3S O3 HO3}
	{C4S H4S C5S H5S}
	{C6S H6S H6T C7S H7S H7T C8S H8S H8T}
	{C9S H9S H9T C10S H10S H10T C11S H11S H11T}
	{C12S H12S H12T C13S H13S H13T C14S H14S H14T}
	{C15S H15S H15T C16S H16S H16T}
	{C17S H17S H17T C18S H18S H18T H18U}
	{C1F OF}
	{C2F H2F H2G C3F H3F H3G C4F H4F H4G}
	{C5F H5F H5G C6F H6F H6G C7F H7F H7G}
	{C8F H8F H8G C9F H9F H9G C10F H10F H10G}
	{C11F H11F H11G C12F H12F H12G C13F H13F H13G}
	{C14F H14F H14G C15F H15F H15G C16F H16F H16G}
	{C17F H17F H17G C18F H18F H18G H18H}
    }

    set map([list type CER180])    {
	SER 
	N
	SER
	CMD2
	CM
	CM
	CM
	CM2
        CT2
        O
        CM
        CM
        CM
        CM
        CM
        CT2
    }

    set map([list name CER180])    {
        OH1
        N
        OH2
        CS3
        CS4
        CS5
        CS6
        CS7
        CS8
        OF1
        CF2
        CF3
        CF4
        CF5
	CF6
	CF7
    }

    set map([list charge CER180])  {
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
        0.0
        0.0
	0.0
	0.0
    }

    set map([list mass CER180])    {
	31.0344
	28.0340
	30.0264
	26.0380
	42.0810
	42.0810
	42.0810
	28.0540
	29.0620
	28.0100
	42.0810
	42.0810
	42.0810
	42.0810
	42.0810
	29.0620
    }

    set map([list bonds CER180]) {
	{OH1 N} {OH2 N} {OH2 CS3}
	{CS3 CS4} {CS4 CS5} {CS5 CS6}
	{CS6 CS7} {CS7 CS8} {N OF1}
	{OF1 CF2} {CF2 CF3} {CF3 CF4} {CF4 CF5}
	{CF5 CF6} {CF6 CF7}
    }

    set map([list angles CER180]) {
	{auto}
    }

    set map([list atomicnumber CER180]) {
	17
	15
	16
	14
	24
	24
	24
	16
	17
	14
	24
	24
	24
	24
	25
    }

    return

}

    ::CGtools::map_ceramide

    if { $::CGtools::maptest } {
	::CGtools::map_stats {CER1 CER2 CER240 CER241 CER482 CER160 CER180}
    }
