# File created 04/08/2020

# Imports
require 'nokogiri'
require 'open-uri'
require_relative 'publication'
require_relative 'contribution'

# Class to scrape Kultura publication page
class BookScraper

	# Created 04/08/2020
	# ------------------------------------
	# Creates a new document object.
	#   (string) url, valid URL
	def initialize url
		@doc = Nokogiri::HTML(open(url))
	end

	# Created 04/08/2020
	# ------------------------------------
	# Processes each edition of kultura from
	# current year/page.
	def parse_years_publications year_publications
		@doc.css('div.short-opis').each do |link|
			print link.content.strip + "\n"
		end
	end
end