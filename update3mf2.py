#!/usr/bin/python3

# V1 - find all objects - 
#  Get the object with the smallest and largest scale, then rescale all other  objects to fit in the gaps




import sys
import re
import os

import io

import pprint
import json


from zipfile import ZipFile

import xml.etree.ElementTree as ET

            
if len(sys.argv) > 1:
    sourceFile=sys.argv[1]
else:
    print("no argv")
    sys.exit()




with ZipFile(sourceFile, "r") as f3mf:

    buffer = f3mf.read("3D/3dmodel.model")
    xml_ms = buffer.decode("utf-8")

    ns1 = "http://schemas.microsoft.com/3dmanufacturing/core/2015/02"
    ET.register_namespace('',ns1)
    p = "{http://schemas.microsoft.com/3dmanufacturing/production/2015/06}"
    p2 = "http://schemas.microsoft.com/3dmanufacturing/production/2015/06"
    ET.register_namespace('p',p2)
    ET.register_namespace("slic3rpe","http://schemas.slic3r.org/3mf/2017/06")
    root = ET.fromstring(xml_ms)
    # print("root.attrib",root.attrib)
    ns = re.match(r'{.*}', root.tag).group(0)







    with ZipFile(sourceFile+".updated.3mf", "w") as f3mf_o:
            for name in f3mf.namelist():
                buffer = f3mf.read(name)

                if name == 'Metadata/model_settings.config':

                    xml = buffer.decode("utf-8")

                    root = ET.fromstring(xml)

                    i = 0

                    for object in root.findall("object"):
                        
                        print(object.attrib)

                        part = object.find("part")
                        print(part.attrib)
                        source_file = ""
                        for metadata in part.findall("metadata[@key='source_file']"):
                            source_file = metadata.attrib["value"]
                            print(metadata.attrib)
                        if "[" in source_file and "]" in source_file:
                            updates = source_file.split('[')[1]
                            updates = updates.split("]")[0]
                            for update in updates.split(","):
                                print("update:",update)
                                if update[0:1] == "E":
                                    if update[1:].isdigit():
                                        extruder_meta = object.find("metadata[@key='extruder']")
                                        extruder_meta.set('value',update[1:])
                                        print(extruder_meta.attrib)
                                    else:
                                        print("extruder not set due to non numeric E value:",update)
                                if update == 'FF':
                                    FF = '<metadata key="flush_into_infill" value="1"/>\n'
                                    FF2= '<metadata key="flush_into_objects" value="1"/>\n'
                                    insert = ET.fromstring(FF)
                                    object.insert(2,insert)
                                    insert = ET.fromstring(FF2)
                                    object.insert(3,insert)
                                if update[0:1] == "W":
                                    if update[1:].isdigit():
                                        WL = '<metadata key="wall_loops" value="' + update[1:] + '"/>'
                                        insert = ET.fromstring(WL)
                                        object.insert(2,insert)
                                    else:
                                        print("walls not set due to non numeric W value:",update)
                                if update[0:1] == "I":
                                    if update[1:].isdigit():
                                        i = '<metadata key="sparse_infill_density" value="' + update[1:] + '%"/>'
                                        insert = ET.fromstring(i)
                                        object.insert(2,insert)
                                    else:
                                        print("infill not set due to non numeric I value:",update)
                                if update[0:1] == "P":
                                    p = '<metadata key="sparse_infill_pattern" value="' + update[1:] + '"/>'
                                    insert = ET.fromstring(p)
                                    object.insert(2,insert)
                                if update[0:1] == "B":
                                    if update[1:].isdigit():
                                        b = '<metadata key="bottom_shell_layers" value="' + update[1:] + '"/>'
                                        insert = ET.fromstring(b)
                                        object.insert(2,insert)
                                    else:
                                        print("bottom shell not set due to non numeric B value:",update)
                                if update[0:1] == "T":
                                    if update[1:].isdigit():
                                        t = '<metadata key="top_shell_layers" value="' + update[1:] + '"/>'
                                        insert = ET.fromstring(t)
                                        object.insert(2,insert)
                                    else:
                                        print("top shell not set due to non numeric T value:",update)

                    ET.indent(root,' ')

                    buffer =  ET.tostring(root, encoding='UTF-8', xml_declaration = True)
                    #print(buffer)
                    

                f3mf_o.writestr(name,buffer)  

                        
           



