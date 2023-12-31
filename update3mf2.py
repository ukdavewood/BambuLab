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

import logging
logging.basicConfig(filename='/var/log/dwpython/dw3mf.log', encoding='utf-8', level=logging.INFO)

try:


            
    if len(sys.argv) > 1:
        sourceFile=sys.argv[1]
    else:
        logging.error("no argv")
        sys.exit()



    logging.debug(sourceFile)

    count = 0

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





        outFile = sourceFile.replace('.u.','.upd.')
        if outFile == sourceFile:
            outFile = sourceFile+".updated.3mf" 

        with ZipFile(outFile, "w") as f3mf_o:
                for name in f3mf.namelist():
                    buffer = f3mf.read(name)

                    if name == 'Metadata/model_settings.config':

                        xml = buffer.decode("utf-8")

                        root = ET.fromstring(xml)

                        i = 0

                        for object in root.findall("object"):
                            
                            logging.info(object.attrib)

                            for part in object.findall("part"):
                                print("part:",part.attrib)
                                for metadata in part.findall("metadata[@key='source_file']"):
                                    source_file = metadata.attrib["value"]
                                    logging.info(metadata.attrib)
                                    print(metadata.attrib)
                                    if "[" in source_file and "]" in source_file:
                                        updates = source_file.split('[')[1]
                                        updates = updates.split("]")[0]
                                        for update in updates.split(","):
                                            print("updatePR:"+update)
                                            logging.info("update:"+update)
                                            if update[0:1] == "E":
                                                if update[1:].isdigit():
                                                    extruder_meta = part.find("metadata[@key='extruder']")
                                                    if extruder_meta is not None:
                                                        extruder_meta.set('value',update[1:])
                                                        print("updated extruder")
                                                    
                                                        logging.info(extruder_meta.attrib)
                                                    else:
                                                        print("need to insert extruder...")
                                                    upd = 1
                                                else:
                                                    logging.error("extruder not set due to non numeric E value:",update)
                                                                    

                            part = object.find("part")
                            logging.info(part.attrib)
                            source_file = ""
                            for metadata in part.findall("metadata[@key='source_file']"):
                                source_file = metadata.attrib["value"]
                                logging.info(metadata.attrib)
                                print(metadata.attrib)
                            upd = 0
                            if "[" in source_file and "]" in source_file:
                                updates = source_file.split('[')[1]
                                updates = updates.split("]")[0]
                                for update in updates.split(","):
                                    print("updatePR:"+update)
                                    logging.info("update:"+update)
                                    if update[0:1] == "E":
                                        if update[1:].isdigit():
                                            extruder_meta = object.find("metadata[@key='extruder']")
                                            extruder_meta.set('value',update[1:])
                                            logging.info(extruder_meta.attrib)
                                            upd = 1
                                        else:
                                            logging.error("extruder not set due to non numeric E value:",update)
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
                                            upd = 1
                                        else:
                                            logging.info("walls not set due to non numeric W value:",update)
                                    if update[0:1] == "I":
                                        if update[1:].isdigit():
                                            i = '<metadata key="sparse_infill_density" value="' + update[1:] + '%"/>'
                                            insert = ET.fromstring(i)
                                            object.insert(2,insert)
                                            upd = 1
                                        else:
                                            logging.info("infill not set due to non numeric I value:",update)
                                    if update[0:1] == "P":
                                        p = '<metadata key="sparse_infill_pattern" value="' + update[1:] + '"/>'
                                        insert = ET.fromstring(p)
                                        object.insert(2,insert)
                                    if update[0:1] == "B":
                                        if update[1:].isdigit():
                                            b = '<metadata key="bottom_shell_layers" value="' + update[1:] + '"/>'
                                            insert = ET.fromstring(b)
                                            object.insert(2,insert)
                                            upd = 1
                                        else:
                                            logging.info("bottom shell not set due to non numeric B value:",update)
                                    if update[0:1] == "T":
                                        if update[1:].isdigit():
                                            t = '<metadata key="top_shell_layers" value="' + update[1:] + '"/>'
                                            insert = ET.fromstring(t)
                                            object.insert(2,insert)
                                            upd = 1
                                        else:
                                            logging.info("top shell not set due to non numeric T value:",update)
                            count = count + upd

                        ET.indent(root,' ')

                        buffer =  ET.tostring(root, encoding='UTF-8', xml_declaration = True)
                        #print(buffer)
                        

                    f3mf_o.writestr(name,buffer) 
    print("ok",count,"objects updated") 

except AssertionError as error:
    logging.error(error)
    logging.error('The linux_interaction() function was not executed')
    print(error)
                        




