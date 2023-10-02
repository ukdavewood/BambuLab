#!/usr/bin/python3

# V1 - layer size stats - for single colour purge target models



import sys
import re
import os


if len(sys.argv) == 3:
    sourceFile=sys.argv[1]
    flushFiles=sys.argv[2]
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
layer = "0"
total_extrude = float(0)
extrude_minus = float(0)
flush = False
total_flush_extrude = float(0)
extrudeT = []
flushT = []
T = 0
xPrev = -999
yPrev = -999
printing_object = False

Prime_TDim = [1000.0,1000.0,0,0]
Object_Dim = [1000.0,1000.0,0,0]
Purge_Dim = [1000.0,1000.0,0.0,0.0]

Tools_on_layer = []

flushP = float(0)

Tool = ""

layer_purges = {}

def UpdateDimensions(x0,y0,flush):
    #print("UD:",x0,y0,flush)
    if x0 == -999:
        x0 = xPrev
    if y0 == -999:
        y0 = yPrev
    
    x1 = xPrev
    y1 = yPrev

    if x0>x1:
        xt = x0
        x0 = x1
        x1 = xt

    if y0>y1:
        yt = y0
        y0 = y1
        y1 = yt

    if not flush:
        if x0 < Object_Dim[0]:
            Object_Dim[0] = x0
        if y0 < Object_Dim[1]:
            Object_Dim[1] = y0
        if x1 > Object_Dim[2]:
            Object_Dim[2] = x1
        if y1 > Object_Dim[3]:
            Object_Dim[3] = y1



for lIndex in range(len(lines)):
    oline = lines[lIndex]
    # Parse gcode line
    if oline.startswith(LAYERNUM):   # Extruder translations
        data = oline[len(LAYERNUM):]
        layerNum = data.split("/")[0]
        totalLayer = data.split("/")[1]
        print("layer,extrude:",layer,round(extrude,2),Tools_on_layer)
        Tools_on_layer.clear()
        Tools_on_layer.append(Tool)
        layer = layerNum
        total_extrude += extrude
        extrude = 0
    


    if oline.startswith("T"):
        Tool = oline.split('\n')[0]
        Tools_on_layer.append(Tool)


    if oline.startswith("; FLUSH_START"):
        flush=True
        flushP = total_flush_extrude
    if oline.startswith("; FLUSH_END"):
        flush=False
        Tools_on_layer.append("F"+str(round(total_flush_extrude-flushP,2)))
        if layer in layer_purges:
            layer_purges[layer] = round(layer_purges[layer] + total_flush_extrude-flushP,2)
        else:
            layer_purges[layer] = round(total_flush_extrude-flushP , 2)            

    
    if oline.startswith("; start printing object"):
        printing_object = True
    if oline.startswith("; stop printing object"):
        printing_object = False

    if oline.startswith("G0 ") or oline.startswith("G1 ") or oline.startswith("G2 ") or oline.startswith("G3 ") :
        parms = oline.split(';')[0].split(" ")
        xVal = -999
        yVal = -999
        amount = ""
        for p in parms:
            if p[0:1] == "E":
                amount = p[1:]
                extrude = extrude + float(amount)
                if float(amount) < 0:
                    extrude_minus += float(amount)
                if flush:
                    total_flush_extrude += float(amount)
            if p[0:1] == "X":
                xVal = float(p[1:])
            if p[0:1] == "Y":
                yVal = float(p[1:])
            # /TODO/ Also need logic for G2, G3


        if amount != "" and layer != "0" and printing_object:
            UpdateDimensions(xVal, yVal, flush)

        if xVal != -999:
            xPrev = xVal

        if yVal != -999:
            yPrev = yVal

    if oline.startswith(";===== wipe nozzle end"):
        print("extrude at wipe nozzle end",round(extrude,2))
            
print("layer,extrude:",layer,round(extrude,2),Tools_on_layer)
total_extrude += extrude
print("Total extrude:",round(total_extrude,2))
print("extrude minus:",round(extrude_minus,2))

print("Adjusted total Extrude M = ", round((total_extrude-29)/1000,2))   
print("Total Flush Extrude M = ",round(total_flush_extrude/1000,2))

print("Object_Dim:",Object_Dim)
print("Layer Purges",layer_purges)

f.close()


for filename in os.listdir(flushFiles):

    if "FlushTo" in filename and ".gcode" in filename:
        print("Flush File:",filename)





