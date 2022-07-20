import sys
import os
import string
#running Genus synthesis,transform Design name into Genus run.tcl 
os.system("./Genus_run.sh %s" %(sys.argv[1]))

