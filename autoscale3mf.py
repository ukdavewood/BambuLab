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

    count = 0.0
    min_x = 999.0
    max_x = 0.0
    min_y = 999.0
    max_y = 0.0
    min_z = 999.0
    max_z = 0.0

    min_v = 999.
    max_v = 0.
    min_id = ""
    max_id = ""


    for item in root.findall(f"./{ns}build/{ns}item"):
        print(item.attrib['transform'])
        tfm = item.attrib['transform'].split(" ")
        if float(tfm[0]) < min_x:
            min_x = float(tfm[0])
        if float(tfm[4]) < min_y:
            min_y = float(tfm[4])
        if float(tfm[8]) < min_z:
            min_z = float(tfm[8])

        if float(tfm[0]) * float(tfm[4]) * float(tfm[8]) < min_v:
            min_v = float(tfm[0]) * float(tfm[4]) * float(tfm[8])
            min_id = item.attrib['objectid'] 

        if float(tfm[0]) * float(tfm[4]) * float(tfm[8]) > max_v:
            max_v = float(tfm[0]) * float(tfm[4]) * float(tfm[8])
            max_id = item.attrib['objectid'] 

        if float(tfm[0]) > max_x:
            max_x = float(tfm[0])
        if float(tfm[4]) > max_y:
            max_y = float(tfm[4])
        if float(tfm[8]) > max_z:
            max_z = float(tfm[8])

        count += 1


    if count < 3 or (min_x == max_x and min_y == max_y and min_z == max_z):
        print("Less than 3 different sized objects found")
        sys.exit()

    print("Min id:",min_id,"Max id:",max_id)
    



    with ZipFile(sourceFile+".rescale.3mf", "w") as f3mf_o:
            for name in f3mf.namelist():
                buffer = f3mf.read(name)

                if name == '3D/3dmodel.model':

                    xml = buffer.decode("utf-8")

                    root = ET.fromstring(xml)

                    i = 0

                    for item in root.findall(f"./{ns}build/{ns}item"):
                        
                        print(item.attrib)
                        if item.attrib['objectid'] == min_id or item.attrib['objectid'] == max_id:      
                            i = i
                        else:
                            i+=1
                            tfm = item.attrib['transform'].split(' ')
                            print(i,"tfm",tfm)
                            new_x = min_x + (max_x-min_x)/(count-1)*i
                            new_y = min_y + (max_y-min_y)/(count-1)*i
                            new_z = min_z + (max_z-min_z)/(count-1)*i
                            tfm[0] = str(round(new_x,2))
                            tfm[4] = str(round(new_y,2))
                            prev_zs = float(tfm[8])
                            tfm[8] = str(round(new_z,2))
                            old_zp = float(tfm[11])
                            new_zp = old_zp/prev_zs * round(new_z,2)
                            tfm[11] = str(round(new_zp,2))

                            print(i,"newtfm",tfm)
                            item.set('transform'," ".join(tfm))

                    buffer =  ET.tostring(root, encoding='UTF-8', xml_declaration = True)
                    #print(buffer)
                    

                f3mf_o.writestr(name,buffer)  

                        
           



