# File created 04/06/2020

# Imports
require 'nokogiri'
require 'open-uri'
require_relative 'publication'
require_relative 'contribution'
require_relative 'scraper'
require_relative 'book_scraper'
require_relative 'sites'

publications = []
puts "Please provide the year you would like or \"a\" for all: "
year = gets.chomp
puts "Please select:\n\t[1] Scrape Periodicals\n\t[2] Scrape Book Publications"
selection = gets.chomp

if selection == '1'
    #if all, scrape all years (time intensive), otherwise just scrape specified year
    unless year == 'a'
        scraper = Scraper.new 'http://kulturaparyska.com/en/historia/publikacje/' + year
        scraper.parse_years_publications publications
    else 
        $sites.length.times do |i|
            year_publications = []
            scraper = Scraper.new $sites[i]
            scraper.parse_years_publications year_publications
            publications.push(year_publications)
        end
        publications.flatten!
    end

    data_file = File.open("periodicals_output.csv","w")
    publications.length.times do |i|
        publications[i].contents.length.times do |j|
            line = publications[i].entry_to_csv(j)
            data_file.write(line)
        end
    end
    data_file.close
    
    
else
    #if all, scrape all years (time intensive), otherwise just scrape specified year
    unless year == 'a'
        scraper = BookScraper.new 'http://kulturaparyska.com/en/historia/publikacje/' + year
        scraper.parse_years_books publications
    else 
        $sites.length.times do |i|
            year_publications = []
            scraper = BookScraper.new $sites[i]
            scraper.parse_years_books year_publications
            publications.push(year_publications)
        end
        publications.flatten!
    end

    data_file = File.open("books_output.csv","w")
    publications.length.times do |i|
        line = publications[i].to_csv
        data_file.write(line)
    end
    data_file.close

end