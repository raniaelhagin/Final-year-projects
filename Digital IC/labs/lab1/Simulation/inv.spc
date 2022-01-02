* Circuit Extracted by Tanner Research's L-Edit Version 8.30 / Extract Version 8.30 ;
* TDB File:  D:\Materials\college\final year\Final-year-projects\Digital IC\labs\lab2\Layout2.tdb
* Cell:  inv	Version 1.06
* Extract Definition File:  morbn20.ext
* Extract Date and Time:  12/30/2021 - 19:17

.include ml5_20.md

* Warning:  Layers with Unassigned AREA Capacitance.
*   <N Diff Resistor>
*   <Poly2 Resistor>
*   <P Diff Resistor>
*   <N Well Resistor>
*   <Poly Resistor>
*   <P Base Resistor>
* Warning:  Layers with Unassigned FRINGE Capacitance.
*   <Pad Comment>
*   <N Diff Resistor>
*   <Poly2 Resistor>
*   <P Diff Resistor>
*   <N Well Resistor>
*   <Poly Resistor>
*   <Poly1-Poly2 Capacitor>
*   <P Base Resistor>
* Warning:  Layers with Zero Resistance.
*   <Pad Comment>
*   <NMOS Capacitor>
*   <PMOS Capacitor>
*   <Poly1-Poly2 Capacitor>

* NODE NAME ALIASES
*       1 = OUT (15,-59)
*       2 = IN (-20,-58.5)
*       3 = VDD (-1,-19.5)
*       4 = GND (-1,-93)


M2 1 2 3 3 PMOS L=2u W=6u AD=36p PD=24u AS=36p PS=24u 
* M2 DRAIN GATE SOURCE BULK (-3 -36 3 -34) 
M1 4 2 1 4 NMOS L=2u W=6u AD=36p PD=24u AS=36p PS=24u 
* M1 DRAIN GATE SOURCE BULK (-3 -76.5 3 -74.5) 

* Total Nodes: 4
* Total Elements: 2
* Total Number of Shorted Elements not written to the SPICE file: 0
* Extract Elapsed Time: 0 seconds
.END
