#!/usr/bin/python
import angr,claripy
import sys, getopt
import os.path
from random import randrange,shuffle
import string
import random
from cStringIO import StringIO
from IPython import embed
import time
import datetime

import sys, getopt

def main(argv):
   inputfile = ''
   outputfile = ''
   try:
       opts, args = getopt.getopt(argv,"hi:",["ifile="])
   except getopt.GetoptError:
      print('test.py -i <inputfile> -o <outputfile>')
      sys.exit(2)
   for opt, arg in opts:
      if opt == '-h':
         print('test.py -i <inputfile> -o <outputfile>')
         sys.exit()
      elif opt in ("-i", "--ifile"):
         inputfile = arg
      elif opt in ("-o", "--ofile"):
         outputfile = arg
   print ('Input file is "', inputfile)
   print ('Output file is "', outputfile)
   proj = angr.Project(inputfile)
   cfg = proj.analyses.CFGFast()
   print (inputfile + " has " +str(len(cfg.graph.edges)) +" edges and "+ str(len(cfg.nodes())) + " nodes")


if __name__ == "__main__":
   main(sys.argv[1:])
