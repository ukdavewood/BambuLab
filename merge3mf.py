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

            
if len(sys.argv) > 2:
    sourceFile=sys.argv[1]
    mergeFile=sys.argv[2]
else:
    print("no argv")
    sys.exit()


#  scan both files for duplicate 3d element names 

#  Extract just objects out of MergeFile
#   Rename any duplicate models
#   Renumber objectids to remove duplicates
#  

ns1 = "http://schemas.microsoft.com/3dmanufacturing/core/2015/02"
ET.register_namespace('',ns1)
ns = '{'+ns1+'}'
p = "{http://schemas.microsoft.com/3dmanufacturing/production/2015/06}"
p2 = "http://schemas.microsoft.com/3dmanufacturing/production/2015/06"
ET.register_namespace('p',p2)
ET.register_namespace("slic3rpe","http://schemas.slic3r.org/3mf/2017/06")


source3d_list = []


with ZipFile(sourceFile, "r") as f3mf:
    for name in f3mf.namelist():
        if name.startswith("3D/Objects/"):
            source3d_list.append(name)


merge3d_duplist = []

with ZipFile(mergeFile, "r") as f3mf:
    for name in f3mf.namelist():
        if name.startswith("3D/Objects/"):
            if name in source3d_list:
                merge3d_duplist.append(name)


        if name == "3D/3dmodel.model":
            merge_3dmodel_buffer = f3mf.read(name)

        if name == "Metadata/model_settings.config":
            merge_model_settings_buffer = f3mf.read(name)

        if name == "Metadata/cut_information.xml":
            merge_cut = f3mf.read(name)


print("duplicates:", merge3d_duplist)

with ZipFile(sourceFile, "r") as f3mf:

    with ZipFile(sourceFile+".merged.3mf", "w") as f3mf_o:
        for name in f3mf.namelist():

            buffer = f3mf.read(name)

            if name == '3D/3dmodel.model':
                print(name)
                xml = buffer.decode("utf-8")

                root = ET.fromstring(xml)


                xml_m = merge_3dmodel_buffer.decode("utf-8")
                
                root_m = ET.fromstring(xml_m)

                object_renum = {}

                resources = root.find(f'{ns}resources')

                for object_m in root_m.findall(f"{ns}resources/{ns}object"):
                    id = object_m.attrib['id']
                    print("merge in resource.object",object_m.attrib['id'])
                    duplicate = root.find(f"{ns}resources/{ns}object[@id='{id}']")
                    if duplicate is not None:
                        new_id = int(id)
                        while duplicate != None:
                            new_id += 1
                            duplicate = root.find(f"{ns}resources/{ns}object[@id='{new_id}']")

                        print("Duplicate id",id, 'new:',new_id)
                        object_renum[id]=str(new_id)
                        object_m.set('id',object_renum[id])
                        print(object_m.attrib)
                    path = object_m.find(f"{ns}components/{ns}component").attrib[f"{p}path"]
                    if path[1:] in merge3d_duplist:
                        object_m.find(f"{ns}components/{ns}component").set(f"{p}path",path.replace("Objects/","Objects/m_"))
                    resources.append(object_m)

                build = root.find(f'{ns}build')

                for object_m in root_m.findall(f"{ns}build/{ns}item"):
                    id = object_m.attrib['objectid']
                    if id in object_renum:
                        object_m.set('objectid',object_renum[id])
                        print("Object renumbered in build.item")

                    build.append(object_m)


                buffer =  ET.tostring(root, encoding='UTF-8', xml_declaration = True)

            if name == 'Metadata/cut_information.xml':

                print (name)

                xml = buffer.decode("utf-8")

                root = ET.fromstring(xml)

                xml_m = merge_cut.decode("utf-8")
                
                root_m = ET.fromstring(xml_m)

                object = root.find("object")

                object_m = root_m.find("object")
                object_m.set("id","2")

                root.append(object_m)


                buffer =  ET.tostring(root, encoding='UTF-8', xml_declaration = True) 





            if name == 'Metadata/model_settings.config':

                print (name)

                xml = buffer.decode("utf-8")

                root = ET.fromstring(xml)


                xml_m = merge_model_settings_buffer.decode("utf-8")
                
                root_m = ET.fromstring(xml_m)




                for object_m in root_m.findall("object"):
                    id = object_m.attrib["id"]
                    if id in object_renum:
                        object_m.set('id',object_renum[id])
                    for metadata in object_m.findall("metadata[@key='name']"):
                        print(metadata.attrib)
                        #metadata.set("value","m_"+metadata.attrib["value"])
                    for part in object_m.findall("part"):
                        for metadata in part.findall("metadata[@key='name']"):
                            print(metadata.attrib)
                            #metadata.set("value","m_"+metadata.attrib["value"])

                    root.insert(1,object_m)

                plate = root.find("plate")

                plate_m = root_m.find("plate")

                for model_instance in plate_m.findall("model_instance"):
                    for metadata in model_instance.findall("metadata"):
                        if metadata.attrib['key'] == 'object_id':
                            id = metadata.attrib['value']
                            if id in object_renum:
                                metadata.set('value',object_renum[id])
                    plate.append(model_instance)



                assemble = root.find("assemble")

                assemble_m = root_m.find("assemble")

                for assemble_item in assemble_m.findall("assemble_item"):

                    id = assemble_item.attrib['object_id']
                    if id in object_renum:
                                assemble_item.set('object_id',object_renum[id])
                    assemble.append(assemble_item)

                buffer =  ET.tostring(root, encoding='UTF-8', xml_declaration = True)

            f3mf_o.writestr(name,buffer)  

        with ZipFile(mergeFile, "r") as f3mf_m:
            for name2 in f3mf_m.namelist():
                if name2.startswith("3D/Objects/"):
                    buffer = f3mf_m.read(name2)
                    if name2 in merge3d_duplist:
                        name3 = name2.replace("Objects/","Objects/m_")
                        print("duplicate merged element renamed to:",name3)
                        f3mf_o.writestr(name3,buffer)
                    else:
                        f3mf_o.writestr(name2,buffer)


                        
           



