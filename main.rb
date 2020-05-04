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
puts "Generate csv? [y/n]"
gen_csv = gets.chomp
#puts "Please provide a file name (do not incude file extension): "
#filename = gets.chomp

if selection == '1'
    #if all, scrape all years (processor intensive), otherwise just scrape specified year
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
    
    #print scraped results
    publications.length.times do |i|
        print publications[i].to_s
    end
    
    
else
    #if all, scrape all years (processor intensive), otherwise just scrape specified year
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

    #print scraped results
    publications.length.times do |i|
        #print publications[i].to_s
    end

    if gen_csv == 'y'
        data_file = File.open("output.csv","w")
        publications.length.times do |i|
            line = publications[i].to_csv
            #print line
            data_file.write(line)
        end
        data_file.close
    end
end