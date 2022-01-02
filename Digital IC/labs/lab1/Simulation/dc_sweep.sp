* SPICE netlist written by S-Edit Win32 6.02
* Written on Dec 30, 2021 at 17:15:28
.include "D:\Materials\college\final year\Final-year-projects\Digital IC\labs\lab1\ml5_20.md"

* Waveform probing commands
.probe
.options probefilename="inverter_sch.dat"
+ probesdbfile="D:\Materials\college\final year\Final-year-projects\Digital IC\labs\lab1\Simulation\inverter_sch.sdb"
+ probetopmodule="Module0"

* Main circuit: Module0
M1 Out In GND GND NMOS L=2u W=22u AD=66p PD=24u AS=66p PS=24u 
M2 Out In Vdd Vdd PMOS L=2u W=22u AD=66p PD=24u AS=66p PS=24u
* End of main circuit: Module0
VSupply Vdd GND 5
Vin In GND 5
.dc lin source Vin 0 5 0.1
.print dc v(In,GND) v(Out,GND)
