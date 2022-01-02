* SPICE netlist written by S-Edit Win32 6.02
* Written on Dec 30, 2021 at 18:56:53
.include ml5_20.md

* Waveform probing commands
.probe
.options probefilename="inverter_sch_lvs.dat"
+ probesdbfile="D:\Materials\college\final year\Final-year-projects\Digital IC\labs\lab1\Simulation\inverter_sch_lvs.sdb"
+ probetopmodule="Module0"

* Main circuit: Module0
M1 Out In GND GND NMOS L=2u W=10.7u AD=66p PD=24u AS=66p PS=24u 
M2 Out In Vdd Vdd PMOS L=2u W=34.3u AD=66p PD=24u AS=66p PS=24u 
* End of main circuit: Module0
