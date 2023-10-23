#!/usr/bin/python
"""
 ZetCode PyQt6 tutorial
 In this example, we select a file with a
 QFileDialog and display its contents
 in a QTextEdit.
 Author: Jan Bodnar
 Website: zetcode.com
 """
from PyQt6.QtWidgets import (QMainWindow, QTextEdit,
         QFileDialog, QApplication)
from PyQt6.QtGui import QIcon, QAction
from pathlib import Path
import sys

filename =""

     #!/usr/bin/python3

# V1 - layer size stats - for single colour purge target models


# Todo
#  1. Check if selected objects fit on plate
#  3. Mark taken objects too - once successful print confirmed.
#  4. Cache Gcode processing for large files
#  5. Improve icons
#  6. Better automate import of flush object / update process
#  7. Create some good flush objects
#  8. Multiple flush folders with priority / non priority
#  9. Remove Prime tower post processor
# 10. Analyse actual flush/flush into object - with graphics
# 11. Prime tower holder modeller
# 12. Better logging and error handling
# 13. bambu studio re-open - bring to front



import sys
import re
import os
import io


from ff import  find_flush 
from dnp import delete_non_print
from prepare import pre_prepare


class FlushProg(QTextEdit):
     def __init__(self, title, parent):
         super().__init__(title, parent)
         self.setAcceptDrops(True)
         self.filename = ""
         self.flush_dir = ""
         self.progress = ""
         self.progress2 = ""
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
             self.flush_dir = path
         else:
             self.filename = path
         self.updateText()
     def updateText(self):
         self.setText("file:"+self.filename+"\nFlush:"+self.flush_dir+"\n"+self.progress+self.progress2)



class Example(QMainWindow):
     def __init__(self):
         super().__init__()
         self.flush_dir=""
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
         print("2:",self.flush_dir)
         self.textEdit = FlushProg("TextEdit",self)
         if len(sys.argv) > 1:
             self.textEdit.filename = sys.argv[1]
         if len(sys.argv) > 2:
             self.textEdit.flush_dir = sys.argv[2]
         self.updateText()
             

         self.setCentralWidget(self.textEdit)

         self.statusBar().showMessage('Ready')
         menubar = self.menuBar()

         allFile = QAction(QIcon('open.png'), 'Open', self)
         allFile.setShortcut('Ctrl+O')
         allFile.setStatusTip('Flush all')
         allFile.triggered.connect(self.All)
         toolbar = self.addToolBar('Exit')
         fileMenu = menubar.addMenu('&File')
         fileMenu.addAction(allFile)
         toolbar.addAction(allFile)
         
         ffFile = QAction(QIcon('open.png'), 'Open', self)
         ffFile.setShortcut('Ctrl+O')
         ffFile.setStatusTip('Find Flush Files')
         ffFile.triggered.connect(self.Flush)
         fileMenu.addAction(ffFile)
         toolbar.addAction(ffFile)
         
         delFile = QAction(QIcon('del.png'), 'del', self)
         delFile.setShortcut('Ctrl+D')
         delFile.setStatusTip('Delete process Files')
         delFile.triggered.connect(self.Delete)
         fileMenu.addAction(delFile)
         toolbar.addAction(delFile)

         preFile = QAction(QIcon('pre.png'), 'pre', self)
         preFile.setShortcut('Ctrl+P')
         preFile.setStatusTip('Pre Prepare Files')
         preFile.triggered.connect(self.Prepare)
         fileMenu.addAction(preFile)
         toolbar.addAction(preFile)

         self.setGeometry(300, 300, 550, 450)
         self.setWindowTitle('Find Flush')
         self.show()




     def All(self):
                 self.Flush()
                 self.Delete()
                 self.Prepare()
                 

                 self.printN("All find_flush completed")

     def Flush(self):
                 self.progress=""
                 find_flush(self,self.textEdit.filename,self.textEdit.flush_dir)


                 print("find_flush completed")

     def Delete(self):
                 self.progress=""
                 for file in os.listdir(self.textEdit.filename+".flush/"):
                      if file.startswith("new."):
                        delete_non_print(self,self.textEdit.filename+".flush/"+file)
                        os.rename(self.textEdit.filename+".flush/"+file,self.textEdit.filename+".flush/"+file+"bak")
                 print("delete process completed")

     def Prepare(self):
                 self.progress=""
                 for file in os.listdir(self.textEdit.filename+".flush/"):
                      if file.startswith("dnp."):
                        pre_prepare(self,self.textEdit.filename+".flush/"+file)
                        os.rename(self.textEdit.filename+".flush/"+file,self.textEdit.filename+".flush/"+file+"bak")
                 print("prepare process completed")


def main():

     filename = ""
     app = QApplication(sys.argv)
     ex = Example()



     sys.exit(app.exec())
if __name__ == '__main__':
     main()


                                        
            



