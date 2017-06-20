#!/bin/bash

# Name: pdfPageCount.sh
# Purpose: get the number of pages in a PDF file write it to stdout

USAGE='Usage: $0 <path to PDF>\n'

# determine script's installation directory and cd to it.
BASENAME=`basename $0`; NOTBASENAME=`echo $0 | sed "s/$BASENAME$//"`
[ "$NOTBASENAME" != "" ] && {
   cd $NOTBASENAME
}

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

pdfinfo $1 | grep Pages | awk '{print $2}'
exit $?
