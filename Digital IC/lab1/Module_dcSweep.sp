
.include "D:\Materials\college\final year\Digital IC\tanner_l_edit\tanner_l_edit\ml5_20.md"
* SPICE netlist written by S-Edit Win32 6.02
* Written on Nov 12, 2021 at 13:50:06

* Waveform probing commands
.probe
.options probefilename="inverter_schematic.dat"
+ probesdbfile="D:\Materials\college\final year\Final-year-projects\Digital IC\lab1\inverter_schematic.sdb"
+ probetopmodule="Module0"

* Main circuit: Module0
M1 Out In GND GND NMOS L=2u W=10.7u AD=66p PD=24u AS=66p PS=24u 
M2 Out In Vdd Vdd PMOS L=2u W=34.5u AD=66p PD=24u AS=66p PS=24u
* End of main circuit: Module0
.dc lin source Vpulse 0 5 0.1
Vsupply Vdd GND 5
Vpulse In GND 5
.print dc v(In,GND) v(Out,GND)

