# File created 04/06/2020

# Imports
require 'nokogiri'
require 'open-uri'
require_relative 'publication'
require_relative 'contribution'

# Class to scrape Kultura publication page
class Scraper

	# Created 04/06/2020
	# ------------------------------------
	# Creates a new document object.
	#   (string) url, valid URL
	def initialize url
		@doc = Nokogiri::HTML(open(url))
	end

	# Created 04/06/2020
	# ------------------------------------
	# Processes each edition of kultura from
	# current year/page.
	def parse_years_publications year_publications
		@doc.css('div.spis-tresci').each do |link|
			publication_contributions = []
			edition_name = parse_publication_data link, publication_contributions
			
			edition = Publication.new(edition_name, publication_contributions)
			year_publications.push(edition)
		end
	end

	private

	# Created 04/06/2020
	# ------------------------------------
	# Parses a single publication and adds it to
	# the contribution list.
	#   (link) publication_link
	#	(list) contributions
	def parse_publication_data publication_link, contributions
		author_names = []
		article_names = []
		edition_name = ""

		publication_link.css('h4.pub-title').each do |publication_data|
			edition_name = publication_data.content.strip.to_s
		end

		publication_link.css('span.nazwisko').each do |data_link|
            author_names.push data_link.content.strip.tr(':','').to_s
		end
		
		publication_link.css('span.tytul').each do |data_link|
            article_names.push data_link.content.strip.tr('\\','').to_s
		end


		author_names.length.times do |i|
			article = Contribution.new(author_names[i], article_names[i])
			contributions.push(article)
		end

		return edition_name
	end
end

puts "Please provide the year you would like: "
year = gets.chomp

year_publications = []
scraper = Scraper.new 'http://kulturaparyska.com/en/historia/publikacje/' + year
scraper.parse_years_publications year_publications

year_publications.length.times do |i|
	print year_publications[i].to_s
end