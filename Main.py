import sys
import os
import string
import shutil
import os.path


#finding all the subfolders in a folder
def finding_subfolder(path):
    list=[]
    #make sure the path exists
    if (os.path.exists(path)):
    #get all the files and sunfolders
        files=os.listdir(path)
        for file in files:
        # get the path of all the paths of dir
            m=os.path.join(path,file)
            #make sure it is a dir
            if(os.path.isdir(m)):
                h=os.path.split(m)
                list.append(h[1])
        print (list)
        return list

#Run Liberte
os.chdir('Liberate')
Liberate_cmd='liberate tcl/char.tcl 2>&1|tee char.log'
os.system(Liberate_cmd)
os.chdir("..")


#copy library file into Genus folder 
os.system("cp -r Liberate/lib Genus/LIB")

Designames=finding_subfolder('Design')

for Designname in Designames:
    if True==os.path.exists('./Design/'+Designname+'/workspace'):
        os.system('rm -r ./Design/'+Designname+'/workspace')
    os.system('mkdir ./Design/'+Designname+'/workspace')
    os.system('cp -r Genus ./Design/'+Designname+'/workspace/Genus')
    os.system('cp -r ./Design/'+Designname+'/RTL ./Design/'+Designname+'/workspace/Genus/RTL')
    os.system('cp -r ./Design/'+Designname+'/SDC ./Design/'+Designname+'/workspace/Genus/SDC')
    os.system('cp Design_script.py ./Design/'+Designname+'/workspace/Design_script.py')


#create new terminals for each design and run VLSI flow in each terminals
for Designname in Designames:
    os.chdir('Design/'+Designname+'/workspace')
    cmd0='python Design_script.py '+Designname   
    cmd1='gnome-terminal -e '+"'"+cmd0+"'"
    print (cmd1)
    os.system(cmd1)
    os.chdir("../../..")

os.system("rm -r Genus/LIB")
os.system("rm -r Liberate/lib")


