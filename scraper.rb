# File created 04/06/2020

# Imports
require 'nokogiri'
require 'open-uri'
require_relative 'publication'

# Class to scrape Kultura publication page
class Scraper

	$publication_hash = {}

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
	def parse_publication_list
        @doc.css('div.spis-tresci').each do |link|
            parse_publication_data link
		end
	end

	private

	# Created 04/06/2020
	# ------------------------------------
	# Parses a single publication and adds it to
	# the publication hash.
	#   (link) publication_link
	def parse_publication_data publication_link
		authors = []
		articles = []
		edition_name = ""

		publication_link.css('h4.pub-title').each do |publication_data|
			edition_name = publication_data.content.strip.to_s
		end

		publication_link.css('span.nazwisko').each do |data_link|
            authors.push data_link.content.strip.tr(':','').to_s
		end
		
		publication_link.css('span.tytul').each do |data_link|
            articles.push data_link.content.strip.tr('\\','').to_s
		end

		contents = authors.zip(articles).to_h
		articles.length.times do |i|
			
		end
		$publication_hash.store(edition_name,contents)
	end
end

scraper = Scraper.new 'http://kulturaparyska.com/en/historia/publikacje/1951'
scraper.parse_publication_list