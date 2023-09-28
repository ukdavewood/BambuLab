# BambuLab

Inspired by this video from the 3d printing professor a few months ago, https://youtu.be/AsokgzDYBBY?si=zLJKxqVY-BaAQAoV 4 I am embarking on a Proof of concept to see if I can completely eliminate wasted purge from my multi colour prints.

Possibly built on top of potential purge length reductions such as these, [Printables 1](https://www.printables.com/model/582382-bambulab-profile-for-up-to-60-purge-reduction/comments)

The problems with ‘purge-to’ objects that I think need addressing are:

Keeping a list/pipeline of worthwhile objects to ‘purge-to’ that do not have critical colouring requirements
Selecting ‘purge-to’ objects with the right layer/infill sizes to match the purge requirements of individual multi-colour objects
Avoiding ‘purge-to’ objects introducing extra unnecessary colour changes of their own
Solve the purge-to not working on 3+ colours on the same layer issue identified in the 3dpp video.
I have raised some of this as a suggestion on makerworld enhancements. Also I am hoping the v2 BL printers introduce something like automated nozzle swapping to eliminate a fair bit of the purge, or even bigger build plates which would mean more room for purge-to objects.

Have made a start on developing some python scripts to analyse the layer by colour extrusions from the GCODE generated by Bambu Studio.

The main objective of the scripts is
a) To automatically select appropriate purge-to objects to go with each multi colour print.
b) To if necessary split the purge-to objects up into colour bands that match the multi-colour print to avoid extra colour swaps
c) If possible to workaround the 3+colour purge-to issue - either by reducing purge lengths to almost zero in BS - and replacing it with carefully chosen coloured layers in purge-to objects, or patching the generated GCODE to move the colour3+ purging into the purge-to objects.

Will probably handle the list/pipeline stuff just with file and folder naming and moving completed prints around.

I have made a start on the scripts and have successfully managed to process the G0,G1,G2 and G3s to different types of extrusion lengths - and I am getting figures fairly close to those shown by BS.

The biggest issue I have found is in with problem 4 - as I have not yet identified a way to determine from the generated GCODE which objects are ‘purge-to’ and which ones are the proper multi colour objects.

Will report progress in this thread if anyone is interested or has any suggestions to help.

My ultimate short term target is to be able to create a plate of these models that is completely waste purge free - with all of the colour swap purging going into random multi coloured tree decoration globes and dummy xmas present boxes.
![alt text](/Images/XmasPud.PNG)
