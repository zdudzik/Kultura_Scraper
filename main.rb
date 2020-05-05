# Imports
require 'nokogiri'
require 'open-uri'
require_relative 'publication'
require_relative 'contribution'
require_relative 'scraper'
require_relative 'book_scraper'
require_relative 'years'

#initalize array for data storage
publications = []

#prompt user for input
puts "Please provide the year you would like or \"a\" for all: "
year = gets.chomp
puts "Please select:\n\t[1] Scrape Periodicals\n\t[2] Scrape Book Publications"
selection = gets.chomp

#scrape periodicals
if selection == '1'

    #if only a single year was specified, scrape the url for that year's publications only
    unless year == 'a'
        scraper = Scraper.new 'http://kulturaparyska.com/en/historia/publikacje/' + year
        scraper.parse_years_publications(publications,year)
    #if 'a' was selected scrape urls for each year
    else 
        $years.length.times do |i|
            year_publications = []
            url = 'http://kulturaparyska.com/en/historia/publikacje/' + $years[i].to_s
            scraper = Scraper.new url
            scraper.parse_years_publications(year_publications,$years[i].to_s)
            publications.push(year_publications)
        end
        publications.flatten!
    end

    #print data to csv file
    data_file = File.open("periodicals_output.csv","w")
    publications.length.times do |i|
        publications[i].contents.length.times do |j|
            line = publications[i].entry_to_csv(j)
            data_file.write(line)
        end
    end
    data_file.close
    
#scrape book publications
else

    #if only a single year was specified, scrape the url for that year's publications only
    unless year == 'a'
        scraper = BookScraper.new 'http://kulturaparyska.com/en/historia/publikacje/' + year
        scraper.parse_years_books(publications,year)
    #if 'a' was selected scrape urls for each year
    else 
        $years.length.times do |i|
            year_publications = []
            url = 'http://kulturaparyska.com/en/historia/publikacje/' + $years[i].to_s
            scraper = BookScraper.new url
            scraper.parse_years_books(year_publications,$years[i].to_s)
            publications.push(year_publications)
        end
        publications.flatten!
    end

    #print data to csv file
    data_file = File.open("books_output.csv","w")
    publications.length.times do |i|
        line = publications[i].to_csv
        data_file.write(line)
    end
    data_file.close
end