#!/usr/bin/python3

# V1 - layer size stats - for single colour purge target models



import sys
import re
import os

import io
import xmltodict
import pprint
import json


from zipfile import ZipFile

import xml.etree.ElementTree as ET


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


layers = {}
            
if len(sys.argv) == 3:
    sourceFile=sys.argv[1]
    flushFiles=sys.argv[2]
else:
    print("no argv")
    sourceFile="~/Documents/GitHub/BambuLab/Gcode/Cube28.gcode"
    sourceFile="~/Documents/GitHub/BambuLab/Gcode/Cube1 2 28.gcode"


with ZipFile(sourceFile, "r") as f3mf:

    for name in f3mf.namelist():
        buffer = f3mf.read(name)
        if name.endswith(".gcode"):     
            print(name)
            with io.TextIOWrapper(f3mf.open(name), encoding="utf-8") as f:
                lines = f.readlines()

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

 
                #  { "1":  { "E" : 11.1, "F": 9.5}, }





                for lIndex in range(len(lines)):
                    oline = lines[lIndex]
                    # Parse gcode line
                    if oline.startswith(LAYERNUM):   # Extruder translations
                        data = oline[len(LAYERNUM):]
                        layerNum = data.split("/")[0]
                        totalLayer = data.split("/")[1]
                        # print("layer,extrude:",layer,round(extrude,2),Tools_on_layer)
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
                            
                # print("layer,extrude:",layer,round(extrude,2),Tools_on_layer)
                total_extrude += extrude
                print("Total extrude:",round(total_extrude,2))
                print("extrude minus:",round(extrude_minus,2))

                print("Adjusted total Extrude = ", round((total_extrude-29)/1000,2),"M")   
                print("Total Flush Extrude = ",round(total_flush_extrude/1000,2),"M")

                print("Object_Dim:",Object_Dim)
                # print("Layers",layers)


#  create table of files, plates, objects sizes and layears
#  scan through project 3mfs in first itteration to get object coordinates, then gcode.3mfs
#  then 

flush = {}
OBJECTSTART = "; start printing object, unique label id:"
OBJECTEND = "; stop printing object, unique label id:"


#  Itteration 1 - get files, plates, objects

files = {}

for filename in os.listdir(flushFiles):

    if filename.endswith(".gcode.3mf"):
       objects = {}
       layer = { "E": 0 }
       extent = { }
       with ZipFile(flushFiles+"/"+filename, "r") as f3mf:
            print("Flush File 3mf:",filename)
            for name in f3mf.namelist():
                if name == 'Metadata/plate_1.gcode':
                    layerNum = 0
                    object_extrude = 0


                    with io.TextIOWrapper(f3mf.open(name), encoding="utf-8") as f:
                        lines = f.readlines()
                        print("Gcode - lines:",len(lines))
                        InObject = False

                        for lIndex in range(len(lines)):
                            oline = lines[lIndex]
                            
                            if oline.startswith(LAYERNUM):   # Extruder translations
                                data = oline[len(LAYERNUM):]
                                layerNum = data.split("/")[0]
                                totalLayer = data.split("/")[1]
                            
                            if oline.startswith(OBJECTSTART):
                                InObject = True
                                object_extrude = 0
                                id = oline[len(OBJECTSTART):].strip()
                                #print(f"ObjectS:<{id}>,Layer:{layerNum}")
                                if id not in objects:
                                    extent = { "X1": 999.0, "Y1": 999.0, "X2": 0.0, "Y2": 0.0}
                                    objects[id] = { "extent": extent, "layers": {} }
                                else:
                                    extent = objects[id]["extent"]

                                yPrev = -999.0
                                xPrev = -999.0


                            if InObject and (oline.startswith("G0 ") or oline.startswith("G1 ") or oline.startswith("G2 ") or oline.startswith("G3 ")) :
                                parms = oline.split(';')[0].split(" ")
                                xPrev = xVal
                                yPrev = yVal
                                xVal = -999.0
                                yVal = -999.0
                                amount = ""
                                for p in parms:
                                    if p[0:1] == "E":
                                        amount = p[1:]
                                        object_extrude = object_extrude + float(amount)

                                    if p[0:1] == "X":
                                        xVal = round(float(p[1:]),2)

                                    if p[0:1] == "Y":
                                        yVal = round(float(p[1:]),2)

                                    # /TODO/ Also need logic for G2, G3

                                if amount != "":
                                    if xPrev != -999.0:
                                        if xPrev < extent["X1"]:
                                            extent["X1"] = xPrev
                                        if xPrev > extent["X2"]:
                                            extent["X2"] = xPrev
                                    if xVal != -999.0:
                                        if xVal < extent["X1"]:
                                            extent["X1"] = xVal
                                        if xVal > extent["X2"]:
                                            extent["X2"] = xVal
                                    if yPrev != -999.0:
                                        if yPrev < extent["Y1"]:
                                            extent["Y1"] = yPrev
                                        if yPrev > extent["Y2"]:
                                            extent["Y2"] = yPrev
                                    if yVal != -999.0:
                                        if yVal < extent["Y1"]:
                                            extent["Y1"] = yVal
                                        if yVal > extent["Y2"]:
                                            extent["Y2"] = yVal

                            if oline.startswith(OBJECTEND):
                                InObject = False
                                id = oline[len(OBJECTEND):].strip()
                                #print(f"ObjectE:<{id}>,Layer:{layerNum}")
                                objects[id]["extent"] = extent
                                objects[id]["layers"][layerNum] = {"E": round(object_extrude,2)}

    #    print("objects:",objects)



       files[filename] = objects

    elif filename.endswith(".3mf"):
        with ZipFile(flushFiles+"/"+filename, "r") as f3mf:

                print("Flush File 3mf:",filename)
                for name in f3mf.namelist():
 

                    if name == 'Metadata/model_settings.config':

                        buffer = f3mf.read(name)

                        print(name)
                        xml = buffer.decode("utf-8")
                        root = ET.fromstring(xml)
                        # print("root.tag",root.tag)
                        # for child in root:
                        #     print(child.tag,child.attrib)

                    if name == '3D/3dmodel.model':

                        buffer = f3mf.read(name)

                        print(name)
                        xml = buffer.decode("utf-8")
                        root = ET.fromstring(xml)
                        #print("root.attrib",root.attrib)
                        ns = re.match(r'{.*}', root.tag).group(0)
                        p = "{http://schemas.microsoft.com/3dmanufacturing/production/2015/06}"
                        #print("ns,p:",ns,p)
                        for node in root.findall(f"./{ns}resources/{ns}object"):
                            id = node.attrib['id']
                            print("id:",node.attrib['id'])
                            for node2 in node.findall(f"./{ns}components/{ns}component"):
                                #print(node2.attrib)
                                path = node2.attrib[f"{p}path"]
                                transform1 = node2.attrib['transform']
                                print("Path,transform:",path,transform1)
                                for item in root.findall(f"./{ns}build/{ns}item[@objectid='{id}']"):
                                    #print("**item:",item.attrib)
                                    transform2 = item.attrib['transform']
                                    print("transform2:",transform2)

selected_objects = []
remaining_flush = total_flush_extrude
objects_left = True
count = 0

while remaining_flush > 10 and objects_left and count < 10:
    print("**Itteration",count)
    count += 1
    highest_flush = 0
    highest_file = ""
    highest_object = ""
    for file_key,objects in files.items():
        print("files:",file_key)
        for object_id,object in objects.items():
            if "Selected" not in object:

                flush_total = 0.0
                print("object:",object_id)
                for key,layer in layers.items():
                    # print ("Layer:",key)
                    if "F" in layer:
                        # print("Check for F",layer["F"],key)
                        if key in object["layers"]:
                            # print("Object layer found:",object["layers"][key])
                            if object["layers"][key]["E"] > layer["F"]:
                                flush_total += layer["F"]
                            else:
                                flush_total += object["layers"][key]["E"]
                print("Flush total:",round(flush_total/1000,2),"M")
                if flush_total > highest_flush:
                    highest_flush = flush_total
                    highest_file = file_key
                    highest_object = object_id

    print("selected object:",highest_file,highest_object,round(highest_flush/1000,2),"M")
    if highest_flush > 100:
        #print("Files:",files)
        files[highest_file][highest_object]["Selected"] = highest_flush
        #  now reduce the availble flush from this object
        remaining_flush = 0
        flush_total = 0
        for key,layer in layers.items():
            # print ("Layer:",key)

            if "F" in layer and layer["F"] > 0:
                # print("Check for F",layer["F"],key)
                if key in files[highest_file][highest_object]["layers"]:
                    # print("Object layer found:",object["layers"][key])
                    if files[highest_file][highest_object]["layers"][key]["E"] > layer["F"]:
                        flush_total += layer["F"]
                        layer["F"] = 0.0
                    else:
                        flush_total += files[highest_file][highest_object]["layers"][key]["E"]
                        layer["F"] -= files[highest_file][highest_object]["layers"][key]["E"]
                        remaining_flush += layer["F"]
                else:
                    remaining_flush += layer["F"]
        print("Flush total:",round(flush_total/1000,2),"M")
        print(" Remaining Flush:", round(remaining_flush/1000,2),"M")

    else:
        print("Flush too small - exiting")
        objects_left= False

# print("Files:",files)

# Transform - Metadata/model.settings
# 200%    <assemble_item object_id="2" instance_id="0" transform="2 0 0 0 2 0 0 0 2 0 0 17.748008728027344" offset="0 0 0" />
# 150%    <assemble_item object_id="2" instance_id="0" transform="1.5 0 0 0 1.5 0 0 0 1.5 0 0 17.748008728027344" offset="0 0 0" />
# 100%    <assemble_item object_id="2" instance_id="0" transform="1 0 0 0 1 0 0 0 1 0 0 17.748008728027344" offset="0 0 0" />



