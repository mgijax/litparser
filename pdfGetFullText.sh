#!/bin/bash

# Name: pdfGetFullText.sh
# Purpose: extract (using pdftotext) the complete text from a PDF file and
#       write it to stdout.
#       Write any error info to stderr.
#       exit code:  0=ok, non-zero means some error.

USAGE="Usage: $0 <path to PDF>\n"

# determine script's installation directory and cd to it.
BASENAME=`basename $0`; NOTBASENAME=`echo $0 | sed "s/$BASENAME$//"`
[ "$NOTBASENAME" != "" ] && {
   cd $NOTBASENAME
}

. ./Configuration               # primarily need $PDFTOTEXT

if [ $# -ne 1 ]; then
	echo $USAGE >&2
	echo 'Error: exactly one parameter required\n' >&2
	exit 1
fi

if [ ! -f "$1" ]; then
	echo $USAGE >&2
	echo 'Error: cannot find file ' $1 >&2
	exit 1
fi

# Check pdftotext version
EXPECTEDVERSION="4.05"
version=`$PDFTOTEXT -v 2>&1 | grep version | awk '{print $3}'`
if [ "$version" != "$EXPECTEDVERSION" ]; then
    echo "$0: Error: $PDFTOTEXT version is $version. Expecting $EXPECTEDVERSION" >&2
    exit 1
fi

TMPFILE=/tmp/litparser.$$.txt
if [ -f ${TMPFILE} ]; then
	rm ${TMPFILE}
fi

# Extract text to $TMPFILE, any error msgs written to stderr.
$PDFTOTEXT -enc ASCII7 -nopgbrk "$1"  $TMPFILE
EXITCODE=$?
if [ $EXITCODE -ne 0 ]; then                     # propogate exitcode
    rm -f $TMPFILE
    exit $EXITCODE
fi

# Add extra '\n' at the end of each line to signify end of paragraph.
# pdftotext 4.02 gathers all the lines of a paragraph into a single line
#   terminated with a single '\n'.
# By adding an additional '\n', we signify paragragh ends with '\n\n' which is
#   consistent with the text extracted using older versions of pdftotext.
# awk's stdout and stderr will be written to this script's stdout and stderr
awk '{sub(/$/,"\n"); print}' $TMPFILE
EXITCODE=$?
rm -f $TMPFILE
exit $EXITCODE
