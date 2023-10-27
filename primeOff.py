#!/usr/bin/python3




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

try:

            
    if len(sys.argv) > 1:
        sourceFile=sys.argv[1]
    else:
        print("no argv")
        sys.exit()


    if not sourceFile.endswith("gcode.3mf"):
        print("Error Not GCODE File")
        exit(0)

    count = 0
    extrude = 0.0

    with ZipFile(sourceFile, "r") as f3mf:

        outFile = sourceFile.replace("gcode.3mf","noprime.gcode.3mf")
        with ZipFile(outFile, "w") as f3mf_o:
                for name in f3mf.namelist():
                    buffer = f3mf.read(name)

                    if name.endswith(".gcode"):     
                        print(name)

                        primeX1 = 999
                        primeX2 = -1
                        primeY1 = 999
                        primeY2 = -1
                        x = -1.0
                        y = -1.0
                        bPrimeCaptured = False
                        bCapture = False


                        with io.TextIOWrapper(f3mf.open(name), encoding="utf-8") as f:
                            lines = f.readlines()

                            bComment = False

                            for lIndex in range(len(lines)):
                                oline = lines[lIndex]

                                if oline.startswith("; FEATURE: Prime tower") and not bPrimeCaptured:
                                    print("Prime Start")
                                    bCapture  = True
                                    bPrimeCaptured = True
                                    

                                if bCapture and oline.startswith("; WIPE_END"):
                                    print("wipe end")
                                    bCapture = False
                                    
                                    print("Prime Captured")
                                    print("primeX1",round(primeX1,2))
                                    print("primeX2",round(primeX2,2))
                                    print("primeY1",round(primeY1,2))
                                    print("primeY2",round(primeY2,2))

                                if oline.startswith("G0") or oline.startswith("G1"):
                                    for p in oline.split(";")[0].split(" "):
                                        if p.startswith("X"):
                                            x = float((p[1:].strip()))
                                        if p.startswith("Y"):
                                            y = float(str.strip(p[1:]))

                                if bCapture and x != -1 and x < primeX1:
                                    primeX1 = x
                                if bCapture and x != -1 and x > primeX2:
                                    primeX2 = x

                                if bCapture and y != -1 and y < primeY1:
                                    primeY1 = y
                                if bCapture and y != -1 and y > primeY2:
                                    primeY2 = y


                            for lIndex in range(len(lines)):
                                oline = lines[lIndex]

                                if oline.startswith("G0") or oline.startswith("G1"):
                                    e = 0.0
                                    for p in oline.split(";")[0].split(" "):
                                        if p.startswith("E"):
                                            e = float(str.strip(p[1:]))
                                        if p.startswith("X"):
                                            x = float(str.strip(p[1:]))
                                        if p.startswith("Y"):
                                            y = float(str.strip(p[1:]))

                                    if x >= primeX1 and x <= primeX2 and y >= primeY1 and y <= primeY2:
                                        lines[lIndex] = ";" + oline
                                        count += 1
                                        extrude += e

                                
                            buffer = "".join(lines)


                    f3mf_o.writestr(name,buffer)  
    print(count,"G0 and G1 commands commented out")
    print(round(extrude/1000,2),"M prime saved")

except AssertionError as error:
    logging.error(error)
    logging.error('The linux_interaction() function was not executed')
                        
           



