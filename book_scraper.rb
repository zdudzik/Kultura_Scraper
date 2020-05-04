# File created 04/08/2020

# Imports
require 'nokogiri'
require 'open-uri'
require_relative 'publication'
require_relative 'contribution'
require_relative 'book'

# Class to scrape Kultura publication page for book publications
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
	def parse_years_books year_books
		@doc.css('div.short-opis').each do |link|
			author = link.css('strong')[0].text.strip
			title = link.css('strong')[1].text.strip
			description = link.css('p').text.strip
			
			book = Book.new(author, title, description)
			year_books.push(book)
		end
	end
end