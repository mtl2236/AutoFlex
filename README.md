# AutoFlex
AutoFlex is a unified evaluation and design framework for flexible hybrid electronics. To use this framework, make sure you are on Linux platform with Python 3.5 or later version. Our EDA tools are Cadence Liberate and Genus. You should have installed them correctly in your environment before setup this framework.

## Code Setup
The code is setup as follows:

![Code_setup](https://user-images.githubusercontent.com/89757542/180166959-edd56f7a-763a-48d7-b879-7e507e7d2ced.png)

The top level directory contains two sub-directories: Liberate and Genus.

* Liberate Scripts/: contains the code for running Cadence Liberate. The output timing and power library is for Genus scripts.
   * Environment Setting: contains several tcl files to setup necessary parameters of Liberate simulation environment, see folder "Liberate/tcl".
   * Simulation Process: contains the inputs for simulation. "Liberate/models" contains compact flexible model written in Verilog-A. "Liberate/netlist" contains standard      cell library netlists. "Liberate/userdata" contains information about cell area.  
* Genus Scripts/: contains the code for runnning Cadence Genus. The output is PPA(Power Performance  Area) report for each benchmark.
   * Environment Setting: contains tcl files to setup necessary parameters of Genus Synthesis environment, see folder "Genus/run.tcl"
   * Benchmark Specification: contains benchmarks written in Verilog and their timing constraint specifications, for example, folder "Design/darkriscv/RTL" contains the      hardware description of a RISC-V core "darkriscv"; folder "Design/darkriscv/SDC" contains the timing constraint and frequency setup for this CPU.

## User Guide
Users can run the whole process with just one Python command:
```
python Main.py
```
When all benchmarks are completed, users can go through each design folder to collect final report in log files of Genus. 

## Results
Normally, the results are extracted from the Genus log files in each benchmark's workspace, for example, in folder "Design/darkriscv/worksapce/Genus/logs".

![result_example](https://user-images.githubusercontent.com/89757542/180213907-8340ed42-3143-4661-8098-f012e89290f4.png)


