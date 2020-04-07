# File created 04/06/2020

# Imports
require 'nokogiri'
require 'open-uri'
require_relative 'publication'
require_relative 'contribution'
require_relative 'scraper'
require_relative 'sites'

puts "Please provide the year you would like or \"a\" for all: "
year = gets.chomp

publications = []

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

publications.length.times do |i|
	print publications[i].to_s
end

print "search for author: "
search = gets.chomp
puts "\n\n------------------------------------\n"

publications.length.times do |i|
    edition = publications[i]
    edition_articles = edition.contents
    edition_articles.length.times do |j|
        if (edition_articles[j].author == search)
            puts edition_articles[j].to_s
        end
    end
end