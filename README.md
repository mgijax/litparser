# litparser
Product for parsing PDF documents to extract text (wrapper over a third-party product)

At present we are using pdfminer to handle extraction of text from PDF files.  Because this requires Python 2.6+, we are using virtualenv to allow us to run it.  

## Installation

1. Clone this product from GitHub.
2. Run the Install script.  (This sets up virtualenv and clones pdfminer from GitHub.)
3. Run the pdf2text.sh, passing in a single argument (the path to the PDF file).  This script invokes pdfminer and writes the results to stdout.  A successful run exits with a zero status; a failure exits with non-zero.

## Future Considerations

1. This wrapper product will allow us to swap out pdfminer for another parsing package at any time, as long as we keep the API to our pdf2text.sh script the same.
