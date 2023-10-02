#!/usr/bin/python3

# V1 - layer size stats - for single colour purge target models



import sys
import re
import os

import io
import xmltodict
import pprint
import json



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

layers = {}
#  { "1":  { "E" : 11.1, "F": 9.5}, }


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
        if layer in layers:
            layers[layer]["E"] = round(extrude,2)
        else:
            layers[layer] = {"E": round(extrude,2)}
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
        if layer in layers and "F" in layers[layer]:
                layers[layer]["F"] = round(layers[layer]["F"] + total_flush_extrude-flushP,2)
        else:
            layers[layer] = {}
            layers[layer]["F"] = round(total_flush_extrude-flushP , 2)            

    
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
print("Layers",layers)

f.close()

from zipfile import ZipFile

for filename in os.listdir(flushFiles):

    if "FlushTo" in filename and ".gcode.3mf" in filename and "copy" in filename and not filename.startswith("NEW"):
        with ZipFile(flushFiles+"/"+filename, "r") as f3mf:
            with ZipFile(flushFiles+"/NEW"+filename, "w") as f3mf_o:
                print("Flush File gcode.3mf:",filename)
                for name in f3mf.namelist():
                    buffer = f3mf.read(name)

    # Little of use in the gcode.3mf version of this file
                    if name == 'Metadata/model_settings.config':

                        config = xmltodict.parse(f3mf.read(name))
                        print("model settings config",len(config))

    #  Actual generated GCODE - there is also an md5 file that goes with this
                    if name.endswith(".gcode"):     
                        print(name)
                        with io.TextIOWrapper(f3mf.open(name), encoding="utf-8") as f:
                            lines = f.readlines()
                            print(len(lines))
                            i=0
                            c=0
                            while (i< len(lines)):

                                if lines[i] == "T1\n":
                                    lines[i] = "T4\n"
                                    c += 1 
                                i += 1

                            buffer = "".join(lines)
                            print(c,"lines changed")

    #  has one entry per object with coordinates that could potentionally be matched up to GCODE, id does not match GCode though
                    if name.startswith("Metadata/plate") and name.endswith("json"):  
                        with io.TextIOWrapper(f3mf.open(name), encoding="utf-8") as f:
                            j = f.read()
                            plate = json.loads(j)
                            print("plate json:",len(plate))  

                    if name == 'Metadata/project_settings.config':
                        with io.TextIOWrapper(f3mf.open(name), encoding="utf-8") as f:
                            j = f.read()
                            project = json.loads(j)
                            print("project gcode 3mf json:",len(project))

                    f3mf_o.writestr(name,buffer)                  

    elif "FlushTo" in filename and filename.endswith("copy.3mf") and "copy" in filename and not filename.startswith("NEW"):
        with ZipFile(flushFiles+"/"+filename, "r") as f3mf:
            with ZipFile(flushFiles+"/NEW"+filename, "w") as f3mf_o:
                print("Flush File 3mf:",filename)
                for name in f3mf.namelist():
                    buffer = f3mf.read(name)

    #  contains per object flush settings in the 3mf version of this file
    #  Ids don't seem to match - but I think coordinates might be able to be derived to identify objects in gcode.
                    if name == 'Metadata/model_settings.config':

                        config = xmltodict.parse(f3mf.read(name))
                        print("model settings config",len(config))

                        if "uncoloured" in filename:
                            print("uncoloured found")
                            lines = buffer.decode("utf-8").split("\n")                            
                            i = 0

                            extruder = ""

                            while i<len(lines):
                                if '<metadata key="name" value=' in lines [i]:
                                    if "[E" in lines[i] and "]" in lines[i]:
                                        extruder = lines[i].split("[E")[1].split("]")[0]                                  
                                        print("extruder",extruder)
                                if '<metadata key="extruder" value="' in lines[i]:
                                    if extruder != "":
                                        ext1 = lines[i].split('value="')
                                        ext2 = ext1[1].split('"')
                                        if ext2[0] != extruder:
                                            ext2[0] = extruder
                                            print(lines[i])
                                            lines[i] = ext1[0] + 'value="' + '"'.join(ext2)
                                            print(lines[i])

                                    extruder = ""
                                    
                                
                                i+=1

                            buffer = "\n".join(lines)

                    if name == '3D/3dmodel.model':

                        lines = buffer.decode("utf-8").split("\n")
                        print("3dmodel.model lines:",len(lines))
                        i =  0

            
                        while i<len(lines):
                            if '<item objectid="10"' in lines[i]:
                                lines[i] = lines[i].replace('printable="1"','printable="0"')
                                transform = lines[i].split("transform=")[1].split("printable")[0]
                                print("Cleared, transform",transform)
                                tfm = transform.split(" ")
                                tfm[9] = "300"
                                lines[i] = lines[i].replace(transform," ".join(tfm))
                                print(lines[i])
                                
                            
                            i+=1

                        buffer = "\n".join(lines)


                    if name == 'Metadata/project_settings.config':
                        with io.TextIOWrapper(f3mf.open(name), encoding="utf-8") as f:
                            j = f.read()
                            project = json.loads(j)
                            print("project  3mf json:",len(project))       

                    f3mf_o.writestr(name,buffer)    


# Transform - Metadata/model.settings
# 200%    <assemble_item object_id="2" instance_id="0" transform="2 0 0 0 2 0 0 0 2 0 0 17.748008728027344" offset="0 0 0" />
# 150%    <assemble_item object_id="2" instance_id="0" transform="1.5 0 0 0 1.5 0 0 0 1.5 0 0 17.748008728027344" offset="0 0 0" />
# 100%    <assemble_item object_id="2" instance_id="0" transform="1 0 0 0 1 0 0 0 1 0 0 17.748008728027344" offset="0 0 0" />



