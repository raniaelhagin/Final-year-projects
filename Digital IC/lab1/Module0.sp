* SPICE netlist written by S-Edit Win32 6.02
* Written on Nov 12, 2021 at 16:11:45

* Waveform probing commands
.probe
.options probefilename="inverter_schematic.dat"
+ probesdbfile="D:\Materials\college\final year\Final-year-projects\Digital IC\lab1\inverter_schematic.sdb"
+ probetopmodule="Module0"
.include "D:\Materials\college\final year\Digital IC\tanner_l_edit\tanner_l_edit\ml5_20.md"

* Main circuit: Module0
M1 Out In GND GND NMOS L=2u W=22u AD=66p PD=24u AS=66p PS=24u 
M2 Out In Vdd Vdd PMOS L=2u W=22u AD=66p PD=24u AS=66p PS=24u
* End of main circuit: Module0
.tran/op 50u 600u method=bdf
Vsupply Vdd GND 5
Vpulse In GND PULSE (0 5 0 0 0 100u 200u)
.print tran v(In,GND) v(Out,GND)