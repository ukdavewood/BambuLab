#!/usr/bin/python3

# Pre upate
#  1. Collect global slicer attributes
#  2. Go through each object
#  2a.  Look for any overrides
#  2b.  Apply updates to source file names
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
logging.basicConfig(filename='/var/log/dwpython/dw3mf.log', encoding='utf-8', level=logging.DEBUG)
logging.debug('This message should go to the log file')
logging.info('So should this')
logging.warning('And this, too')
logging.error('And non-ASCII stuff, too, like Øresund and Malmö')

try:

            
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

        buffer = f3mf.read("Metadata/project_settings.config")
        settings = json.loads(buffer)
        # print("settings:",settings)

        # bottom_shell_layers
        # sparse_infill_density
        # top_shell_layers
        # sparse_infill_pattern
        # wall_loops





        with ZipFile(sourceFile+".preupdate.3mf", "w") as f3mf_o:
                for name in f3mf.namelist():
                    buffer = f3mf.read(name)

                    if name == 'Metadata/model_settings.config':

                        xml = buffer.decode("utf-8")

                        root = ET.fromstring(xml)

                        i = 0

                        for object in root.findall("object"):
                            
                            # print(object.attrib)

                            source_file = ""
                            settings_copy = {}
                            settings_copy["bottom_shell_layers"] = settings["bottom_shell_layers"]
                            settings_copy["sparse_infill_density"] = settings["sparse_infill_density"]
                            settings_copy["top_shell_layers"]=settings["top_shell_layers"]
                            settings_copy["sparse_infill_pattern"]=settings["sparse_infill_pattern"]
                            settings_copy["wall_loops"]=settings["wall_loops"]

                            for metadata in object.findall("metadata"):
                                settings_copy[metadata.attrib["key"]]=metadata.attrib["value"]

                            # print("settings_copy:",settings_copy)

                            settings_coded = "[B" +  settings_copy["bottom_shell_layers"] + \
                                            ",I" + settings_copy["sparse_infill_density"].replace("%","") + \
                                            ",T" + settings_copy["top_shell_layers"] + \
                                            ",P" + settings_copy["sparse_infill_pattern"] + \
                                            ",W" + settings_copy["wall_loops"] + "]"
                            
                            print("coded:",settings_coded)

                            part = object.find("part")
                            print(part.attrib)
                            found = False
                            for metadata in part.findall("metadata[@key='source_file']"):
                                source_file = metadata.attrib["value"]
                                if "[" in source_file:
                                    source_file = source_file[0:source_file.find("[")]
                                source_file = source_file + " " + settings_coded
                                metadata.set("value",source_file)

                                print("source_file:",source_file)
                                found = True
                            if not found:
                                sf_metadata = ET.fromstring(f'<metadata key="source_file"  value="{settings_coded}"/>')
                                part.append(sf_metadata)
                                print("appended")
                                


                        ET.indent(root,' ')

                        buffer =  ET.tostring(root, encoding='UTF-8', xml_declaration = True)
                        #print(buffer)
                        

                    f3mf_o.writestr(name,buffer)  

except AssertionError as error:
    logging.error(error)
    logging.error('The linux_interaction() function was not executed')
                        
           



