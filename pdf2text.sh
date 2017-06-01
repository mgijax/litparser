#!/usr/local/bin/bash

# Name: pdf2text.sh
# Purpose: extract (using a pdfminer) the text from a PDF file and write it
#	to stdout

USAGE='Usage: $0 <path to PDF>\n'

if [ $# -ne 1 ]; then
	echo $USAGE
	echo 'Error: exactly one parameter required\n'
	exit 1
fi

if [ ! -f $1 ]; then
	echo $USAGE
	echo 'Error: cannot find file ' $1
	exit 1
fi

# pick up the virtual python environment and run pdfminer extraction script
source ./virtenv/bin/activate 
./pdfminer/build/scripts-2.7/pdf2txt.py $1
exit $?
