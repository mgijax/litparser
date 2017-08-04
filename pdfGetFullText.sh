#!/bin/bash

# Name: pdfGetFullText.sh
# Purpose: extract (using pdftotext, included with our Linux installation) the
#	complete text from a PDF file and write it to stdout

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

FILE=/tmp/litparser.$$.txt

if [ -f ${FILE} ]; then
	rm ${FILE}
fi

#pdftotext -q -nopgbrk $1 $FILE
pdftotext -enc ASCII7 -q -nopgbrk $1 $FILE
EXITCODE=$?
cat ${FILE}
rm ${FILE}
exit ${EXITCODE}
