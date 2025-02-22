﻿;START GCODE
M201 X1000 Y1000 Z200 E5000 ; sets maximum accelerations, mm/sec^2
M203 X200 Y200 Z12 E120 ; sets maximum feedrates, mm / sec
M204 S1250 T1250 ; sets acceleration (S) and retract acceleration (R), mm/sec^2
M205 X8.00 Y8.00 Z0.40 E4.50 ; sets the jerk limits, mm/sec
M205 S0 T0 ; sets the minimum extruding and travel feed rate, mm/sec
;TYPE:Custom
M862.3 P "MK3S" ; printer model check
M862.1 P0.4 ; nozzle diameter check
M115 U3.13.3 ; tell printer latest fw version
G90 ; use absolute coordinates
M83 ; extruder relative mode
M104 S215 ; set extruder temp
M140 S60 ; set bed temp
M190 S60 ; wait for bed temp
M109 S215 ; wait for extruder temp
G28 W ; home all without mesh bed level
G80 X86.6877 Y64.7708 W85.2412 H59.1573 ; mesh bed levelling
G1 Z0.2 F720
G1 Y-3 F1000 ; go outside print area
G92 E0
G1 X60 E9 F1000 ; intro line
G1 X100 E12.5 F1000 ; intro line
G92 E0
M221 S95
; Don't change E values below. Excessive value can damage the printer.
M907 E538 ; set extruder motor current
G21 ; set units to millimeters
G90 ; use absolute coordinates
M83 ; use relative distances for extrusion
M900 K0.05 ; Filament gcode LA 1.5
M900 K30 ; Filament gcode LA 1.0
M107
G1 X5.000 Y1.000 F1200.0
G1 X30.000 E-1.78476 F600.0
['G1 Z1.000']
G1 X10.000 Y10.000 Z1.000 F1200.0
G1 Y20.000 E-0.71390 F600.0
; END Gcode
M204 S1000
M107
;TYPE:Custom
; Filament-specific end gcode
G1 Z180 F720 ; Move print head further up
G1 X0 Y200 F3600 ; park
G4 ; wait
M221 S100 ; reset flow
M900 K0 ; reset LA
M104 S0 ; turn off temperature
M140 S0 ; turn off heatbed
M107 ; turn off fan
M84 ; disable motors
M73 P100 R0 ; print progress done
M73 Q100 S0 ; print progress done