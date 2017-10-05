#!/usr/local/bin/python

# Name: getFirstDOI.py
# Purpose: extract the first DOI ID for the specified paper and write it to stdout

import sys
sys.path.insert(0, '/usr/local/mgi/live/lib/python')
sys.path.insert(0, '/home/jsb/jax/prod/lib/python')

import os
import PdfParser

PdfParser.setLitParserDir(os.getcwd())
for filename in sys.argv[1:]:
    parser = PdfParser.PdfParser(filename)
    print parser.getFirstDoiID()