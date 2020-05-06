### Sample data
In this folder are two raw .csv files, the same that would be output by running the program with the `a` option,
for both periodicals, and book publications.

There are also two excel sheets, which have imported the csv's with the proper UTF-8 character encoding. 
The periodical excel sheet has been left unaltered, while the book publications sheet has had two changes from raw csv:
* The data has been cleaned. There are some issues of Kultura, and Bibliografia that are listed as book publications
  on the Instytut Literacki website. These have been removed in post processing to get a narrower look at just books.
  
* A pivot chart and graph have been added to give an example of what types of anaylsis may be done. This graph looks at the
  number of books published by each author per year. It is filtered for the top 10.
