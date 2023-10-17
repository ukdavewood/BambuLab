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


class Example(QMainWindow):
     def __init__(self):
         super().__init__()
         self.flush_dir=""
         self.filename=""
         self.progress = ""
         self.initUI()
     def addProgress(self,prog):
         self.progress = self.progress + prog + '\n'
         self.updateText()
     def updateText(self):

         self.textEdit.setText("file:"+self.filename+"\nFlush:"+self.flush_dir+"\n"+self.progress)
     def initUI(self):
         print("2:",self.flush_dir)
         self.textEdit = QTextEdit()
         self.setCentralWidget(self.textEdit)

         self.statusBar()
         openFile = QAction(QIcon('open.png'), 'Open', self)
         openFile.setShortcut('Ctrl+O')
         openFile.setStatusTip('Open new File')
         openFile.triggered.connect(self.showDialog)
         menubar = self.menuBar()
         fileMenu = menubar.addMenu('&File')
         fileMenu.addAction(openFile)
         self.setGeometry(300, 300, 550, 450)
         self.setWindowTitle('File dialog')
         self.show()
     def showDialog(self):
         home_dir = str(Path.home())
         fname = QFileDialog.getOpenFileName(self, 'Open file', home_dir)
         if fname[0]:
             f = open(fname[0], 'r')
             with f:
                 data = f.read()
                 self.textEdit.setText(data)
def main():

     filename = ""
     app = QApplication(sys.argv)
     ex = Example()
     ex.filename= "file"
     ex.flush_dir = "/Users/davidwood/Documents/GitHub/BambuLab/Gcode/flush/"
     ex.updateText()
     for i in range(1,10):
         ex.addProgress(str(i))
        


     sys.exit(app.exec())
if __name__ == '__main__':
     main()