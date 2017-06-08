#!/usr/local/bin/bash

# Name: pdfGetFullText.sh
# Purpose: extract (using a pdfminer) the complete text from a PDF file and
#	write it to stdout
# Notes: The underlying package (pdfminer) has an unstated limit of 64k for
#	text extracted per run, so we need to work around that here.

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

pdftotext -q -nopgbrk $1 $FILE
EXITCODE=$?
cat ${FILE}
rm ${FILE}
exit ${EXITCODE}
