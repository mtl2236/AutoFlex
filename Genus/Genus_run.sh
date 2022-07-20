#!/bin/bash
#import top_cell name
sed -i "2c set DESIGN $1" run.tcl
#run Genus
genus -f run.tcl -log logs/base.log

