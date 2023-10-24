#!/usr/bin/python

from PyQt6.QtWidgets import (QMainWindow, QTextEdit,
         QFileDialog, QApplication)
from PyQt6.QtGui import QIcon, QAction
from pathlib import Path
import sys

filename =""

# V1 - layer size stats - for single colour purge target models


# Todo
#  7. Create some good flush objects
#  9. Remove Prime tower post processor
# 11. Prime tower holder modeller
# 16. Within Itteration if too small don't retry next time
#  6. Better automate import of flush object / update process
#       CMD+I, select files,  A,  Shift+CMD+S,   CMD+R
#  3. Mark taken objects too - once successful print confirmed.
#  4. Cache Gcode processing for large files
#  1. Check if selected objects fit on plate
# 12. Better logging and error handling
# 10. Analyse actual flush/flush into object - with graphics

# Done
# 15. Cancel button
#  8. Multiple flush folders with priority / non priority
# 14. u.3mf.updated - to just upd.3mf
#  5. Improve icons
# 13. bambu studio re-open - bring to front



import sys
import re
import os
import io


from ff import  find_flush 
from dnp import delete_non_print
from prepare import pre_prepare

basedir = os.path.dirname(__file__)
icondir = os.path.join(basedir,"icons")


class FlushProg(QTextEdit):
     def __init__(self, title, parent):
         super().__init__(title, parent)
         self.setAcceptDrops(True)
         self.filename = ""
         self.flush_dir_list = ""
         self.progress = ""
         self.progress2 = ""
         self.cancel = False
     def dragEnterEvent(self, e):
         if e.mimeData().hasFormat('text/uri-list') and len(e.mimeData().urls()) == 1 \
              and e.mimeData().urls()[0].isLocalFile():
             e.accept()
         else:
             print("ignore:",e.mimeData().formats())
             e.ignore()
     def dropEvent(self, e):
         path = e.mimeData().urls()[0].path()
         if path.endswith('/'):
             self.flush_dir_list = path+";"+self.flush_dir_list
         else:
             self.filename = path
         self.updateText()
     def updateText(self):
         self.setText("file:"+self.filename+"\nFlush:"+self.flush_dir_list+"\n"+self.progress+self.progress2)



class Example(QMainWindow):
     def __init__(self):
         super().__init__()
         self.flush_dir_list=""
         self.filename=""
        #  self.progress = ""
        #  self.progress2 = ""
         self.initUI()
    
     def print(self, *values: object):
        #  print(values)
         self.textEdit.progress2 = ""
         for value in values:
            self.textEdit.progress2 = self.textEdit.progress2 + " " + str(value)
         self.updateText()
        #  print(values)
         QApplication.processEvents()
     def printN(self, *values: object):
        #  print(values)

         for value in values:
            self.textEdit.progress = self.textEdit.progress + " " + str(value)
         self.textEdit.progress = self.textEdit.progress + '\n'
         self.updateText()
        #  print(values)
         QApplication.processEvents()
     def updateText(self):

         self.textEdit.updateText()
         self.textEdit.verticalScrollBar().setValue(self.textEdit.verticalScrollBar().maximum())

     def initUI(self):
         print("2:",self.flush_dir_list)
         self.textEdit = FlushProg("TextEdit",self)
         if len(sys.argv) > 1:
             self.textEdit.filename = sys.argv[1]
         if len(sys.argv) > 2:
             self.textEdit.flush_dir_list = sys.argv[2]
         self.updateText()
             

         self.setCentralWidget(self.textEdit)

         self.statusBar().showMessage('Ready')
         menubar = self.menuBar()

         allFile = QAction(QIcon(os.path.join(icondir,'ff.png')), 'Open', self)
         allFile.setShortcut('Ctrl+O')
         allFile.setStatusTip('Flush all')
         allFile.triggered.connect(self.All)
         toolbar = self.addToolBar('Exit')
         fileMenu = menubar.addMenu('&File')
         fileMenu.addAction(allFile)
         toolbar.addAction(allFile)
         
         ffFile = QAction(QIcon(os.path.join(icondir,'open.png')), 'Open', self)
         ffFile.setShortcut('Ctrl+O')
         ffFile.setStatusTip('Find Flush Files')
         ffFile.triggered.connect(self.Flush)
         fileMenu.addAction(ffFile)
         toolbar.addAction(ffFile)
         
         delFile = QAction(QIcon(os.path.join(icondir,'del.png')), 'del', self)
         delFile.setShortcut('Ctrl+D')
         delFile.setStatusTip('Delete process Files')
         delFile.triggered.connect(self.Delete)
         fileMenu.addAction(delFile)
         toolbar.addAction(delFile)

         preFile = QAction(QIcon(os.path.join(icondir,'upd.png')), 'pre', self)
         preFile.setShortcut('Ctrl+P')
         preFile.setStatusTip('Pre Prepare Files')
         preFile.triggered.connect(self.Prepare)
         fileMenu.addAction(preFile)
         toolbar.addAction(preFile)

         cancelBut = QAction(QIcon(os.path.join(icondir,'cancel.png')), 'pre', self)
         cancelBut.setShortcut('Ctrl+C')
         cancelBut.setStatusTip('Cancel scheduled')
         cancelBut.triggered.connect(self.setCancel)
         fileMenu.addAction(cancelBut)
         toolbar.addAction(cancelBut)

         self.setGeometry(300, 300, 550, 450)
         self.setWindowTitle('Find Flush')
         self.show()




     def All(self):
                 self.cancel = False
                 try:
                    self.Flush()
                    if not self.cancel:
                         self.Delete()
                    if not self.cancel:
                         self.Prepare()
                    

                    self.printN("All find_flush completed")
                 except:
                      self.printN("Error:",sys.exc_info())

     def Flush(self):
                 self.cancel = False
                 try:
                    self.progress=""
                    find_flush(self,self.textEdit.filename,self.textEdit.flush_dir_list)


                    print("find_flush completed")
                 except:
                      self.printN("Error:",sys.exc_info())

     def Delete(self):
                 self.cancel = False
                 try:
                    self.progress=""
                    for file in os.listdir(self.textEdit.filename+".flush/"):
                        if file.startswith("new."):
                            delete_non_print(self,self.textEdit.filename+".flush/"+file)
                            os.rename(self.textEdit.filename+".flush/"+file,self.textEdit.filename+".flush/"+file+"bak")
                    print("delete process completed")
                 except:
                      self.printN("Error:",sys.exc_info())

     def Prepare(self):
                 self.cancel = False
                 try:
                    
                    self.progress=""
                    for file in os.listdir(self.textEdit.filename+".flush/"):
                        if file.startswith("dnp."):
                            pre_prepare(self,self.textEdit.filename+".flush/"+file)
                            os.rename(self.textEdit.filename+".flush/"+file,self.textEdit.filename+".flush/"+file+"bak")
                    print("prepare process completed")
                 except:
                      self.printN("Error:",sys.exc_info())

     def setCancel(self):
                 self.cancel = True


def main():

     filename = ""
     app = QApplication(sys.argv)
     ex = Example()



     sys.exit(app.exec())
if __name__ == '__main__':
     main()


                                        
            



