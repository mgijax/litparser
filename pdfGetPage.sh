#!/bin/bash

# Name: pdfGetPage.sh
# Purpose: extract (using a pdfminer) the text for a specified page number
#	from a PDF file and write it to stdout

USAGE='Usage: $0 <page number> <path to PDF>\n'

# determine script's installation directory and cd to it.
BASENAME=`basename $0`; NOTBASENAME=`echo $0 | sed "s/$BASENAME$//"`
[ "$NOTBASENAME" != "" ] && {
   cd $NOTBASENAME
}

if [ $# -ne 2 ]; then
	echo $USAGE
	echo 'Error: exactly two parameters required\n'
	exit 1
fi

if [ ! -f $2 ]; then
	echo $USAGE
	echo 'Error: cannot find file ' $2
	exit 1
fi

FILE=/tmp/litparser.$$.txt

if [ -f ${FILE} ]; then
	rm ${FILE}
fi

pdftotext -f $1 -l $1 -q -nopgbrk $2 ${FILE}
cat ${FILE}
rm ${FILE}
