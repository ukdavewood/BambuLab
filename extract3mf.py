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




with ZipFile(sourceFile, "r") as f3mf:

   f3mf.extractall(path=sourceFile+"xx")
   print("Files extracted")

