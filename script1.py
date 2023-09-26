#!/usr/bin/python3

# V1 - layer size stats - for single colour purge target models



import sys
import re
import os


if len(sys.argv) == 2:
    sourceFile=sys.argv[1]
else:
    print("no argv")
    sourceFile="~/Documents/GitHub/BambuLab/Gcode/Cube28.gcode"
    sourceFile="~/Documents/GitHub/BambuLab/Gcode/Cube1 2 28.gcode"

# Read the ENTIRE g-code file into memory
with open(sourceFile, "r") as f:
    lines = f.readlines()

destFile = sourceFile+"_stats"

LAYERNUM = "; layer num/total_layer_count: "

extrude = float(0)
layer = 0
total_extrude = float(0)
extrude_minus = float(0)

for lIndex in range(len(lines)):
    oline = lines[lIndex]
    # Parse gcode line
    if oline.startswith(LAYERNUM):   # Extruder translations
        data = oline[len(LAYERNUM):]
        layerNum = data.split("/")[0]
        totalLayer = data.split("/")[1]
        print("layer,extrude:",layer,round(extrude,2))
        layer = layerNum
        total_extrude += extrude
        extrude = 0

    if oline.startswith("G0 ") or oline.startswith("G1 "):
        parms = oline.split(';')[0].split(" ")
        for p in parms:
            if p[0:1] == "E":
                amount = p[1:]
                extrude = extrude + float(amount)
                if float(amount) < 0:
                    extrude_minus += float(amount)
    if oline.startswith(";===== wipe nozzle end"):
        print("extrude at wipe nozzle end",round(extrude,2))
            
print("layer,extrude:",layer,round(extrude,2))
total_extrude += extrude
print("Total extrude:",round(total_extrude,2))
print("extrude minus:",round(extrude_minus,2))
        

f.close()




