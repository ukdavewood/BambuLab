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

def delete_non_print(ex,sourceFile):


  ex.printN(sourceFile)

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

    delete_list = []

    count = 0
    total = 0

    for item in root.findall(f"./{ns}build/{ns}item"):
        total += 1

        if item.attrib['printable'] == '0':
            count += 1
            delete_list.append(item.attrib["objectid"])
       



    if count < 1 :
        ex.printN("No objects found to delete")
    

    # if count < 1 :
    #     ex.printN("All objects non printable - exiting")
    #     return()

    ex.print("Delete list:",delete_list)
    

    if True:

        with ZipFile(sourceFile.replace("new.","dnp."), "w") as f3mf_o:
            for name in f3mf.namelist():
                buffer = f3mf.read(name)



                if name == '3D/3dmodel.model':
                    ex.print(name)
                    xml = buffer.decode("utf-8")

                    root = ET.fromstring(xml)

                    i = 0
                    res = root.find(f"{ns}resources")
                    for object in res.findall(f"{ns}object"):

                        
                        if object.attrib['id'] in delete_list:
                            ex.print("Remove resources.object id:",object.attrib['id'])
                            res.remove(object)

                    build = root.find(f"{ns}build")
                    for item in build.findall(f"{ns}item"):

                        
                        if item.attrib['objectid'] in delete_list:
                            ex.print("Remove build.item id:",item.attrib['objectid'])
                            build.remove(item)
  

                    buffer =  ET.tostring(root, encoding='UTF-8', xml_declaration = True)

                # cut_information.xml - might need to remove one row - but try without

                if name == 'Metadata/model_settings.config':

                    ex.print (name)

                    xml = buffer.decode("utf-8")

                    root = ET.fromstring(xml)

                    i = 0

                    for object in root.findall(f"object"):

                        
                        if object.attrib['id'] in delete_list:
                            ex.print("Remove config.object id:",object.attrib['id'])
                            root.remove(object)


                    plate = root.find("plate")
                    for model_instance in plate.findall('model_instance'):
                        object = model_instance.find("metadata[@key='object_id']")
                        id = object.attrib["value"]
                        
                        if id in delete_list:
                            ex.print("Remove Model instance id:",id)
                            plate.remove(model_instance)

                    assemble = root.find("assemble")
                    for assemble_item in assemble.findall('assemble_item'):
                        if assemble_item.attrib['object_id'] in delete_list:
                            ex.print("remove assemble_item:",assemble_item.attrib['object_id'])
                            assemble.remove(assemble_item)
  

                    buffer =  ET.tostring(root, encoding='UTF-8', xml_declaration = True)



                f3mf_o.writestr(name,buffer)  

                        
           



