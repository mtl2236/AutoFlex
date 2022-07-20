import sys
import os
import string
import shutil


Genus_path='./Genus'
os.chdir(Genus_path)
Genus_cmd="python Genus_run.py"+' '+sys.argv[1]
os.system(Genus_cmd) 
os.chdir("../")   
