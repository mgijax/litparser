# litparser
Product for parsing PDF documents to extract text (wrapper over another product that actually does the extraction)

At present we are using pdftotext, which is included with our Linux installations.

## Installation

1. Clone this product from GitHub.
2. Run the Install script. 

## Usage

* Run the pdfGetFullText.sh to process an entire PDF file.  Takes one parameter:  the path to the PDF file.  Writes the extracted text to stdout.  A successful run exits with a zero status; a failure exits with non-zero.
* Run the pdfGetPage.sh script to extract text from only a single page of the PDF file.  Takes two parameters:  page number and path to PDF file.  Writes to stdout.  A successful run exits with a zero status; a failure exits with non-zero.
* Run the pdfGetPageCount.sh script to get a count of pages into the PDF file.  Takes one parameter:  path to the PDF file.  Writes the page count to stdout.

## Future Considerations

1. This wrapper product will allow us to swap out pdftotext for another parsing package at any time, as long as we keep the API to our pdfGetFullText.sh script the same.
