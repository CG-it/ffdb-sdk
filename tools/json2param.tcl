#!/usr/bin/tclsh8.5
## Converts JSON parameter file to original parameter format
## for easier editing

#./json2param file.json

proc json2param {filename} {

  ## Slurp up the file
  set data [read [set fid [open $filename]]][close $fid]

  ## Need the json package
  if {[catch {package present "json"}]} {
      source [file join [pwd] json.tcl]
      package require json
  }

  ## Read the json, convert to dict, get params section
  set data [::json::json2dict $data]
  set params [dict get $data params]

  ## Output each of the params
  foreach p $params {
    dict with p {}
    switch -exact $param {
      bond {
        puts stdout [format "%10s %5s %5s %10s %8.4f %8.1f"\
          $param {*}$types $potential $k $r0]
      }
      angle {
        puts stdout [format "%10s %5s %5s %5s %10s %8.4f %8.1f"\
          $param {*}$types $potential $k $theta0]
      }
      dihedral {
        puts stdout [format "%10s %5s %5s %5s %5s %10s %8.4f %1d %4d"\
          $param {*}$types $potential $k $n $d]
      }
      pair {
        puts stdout [format "%10s %5s %5s %10s %8.4f %8.4f"\
          $param {*}$types $potential $epsilon $sigma]
      }
      default {puts " Unknown Key $param: Skipping"; continue}
    }
  }
}
