# Kultura_Scraper
Web Scraper for Instytut Literacki book publications and periodicals.

### Setup Instructions
All you need installed to run the scraper is Ruby. To check if you already have Ruby installed
open your terminal and run: `ruby -v`

If ruby is not installed installation insructions can be found here:
https://www.ruby-lang.org/en/documentation/installation/

### Running the Scraper
* Clone or Download the repository to an accessable location on your computer. 
* In your terminal navigate to the Kultura_Scraper directory and run: `ruby main.rb`
* Provide either a specific year to scrape, or `a` to scrape through all years
* set scraping mode to either Kultura periodical or book publications

Data will be saved in the main directory as csv files, which can be opened and viewed in Excel, Libre, or a program of your choice.

**Important Note** Excel uses a unique character encoding scheme that will impact the appearance of characters with diacritics (ą,ę,ł,etc.). To avoid this issue do not open the .csv file directly into excel, Instead:

* open an excel sheet
* in the data tab, click add source from text/csv, and select file
* change `File Origin` from **1252: Western European (Windows)** to **65001: Unicode (UTF-8)**

### Provided Data
In the `Sample_Data` you can see two csv files which contain data from all years, as well as two excel spreadsheets with cleaned data.
