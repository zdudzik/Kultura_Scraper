# Imports
require 'nokogiri'
require 'open-uri'
require_relative '../Models/publication'
require_relative '../Models/contribution'

# Class to scrape Kultura publication page for periodicals
class Scraper

	# ------------------------------------
	# Creates a new document object.
	#   (string) url, valid URL
	def initialize url
		@doc = Nokogiri::HTML(open(url))
	end

	# ------------------------------------
	# Processes each edition of kultura from
	# current year/page.
	def parse_years_publications year_publications, year
		@doc.css('div.spis-tresci').each do |link|
			publication_contributions = []
			edition_name = parse_publication_data link, publication_contributions
			
			edition = Publication.new(edition_name, publication_contributions, year)
			year_publications.push(edition)
		end
	end

	private

	# ------------------------------------
	# Parses a single publication and adds it to
	# the contribution list.
	#   (link) publication_link
	#	(list) contributions
	def parse_publication_data publication_link, contributions
		author_names = []
		article_names = []
		edition_name = ""

		#scrape title
		publication_link.css('h4.pub-title').each do |publication_data|
			edition_name = publication_data.content.strip.to_s
		end

		#scrape author name
		publication_link.css('span.nazwisko').each do |data_link|
            author_names.push data_link.content.strip.tr(':','').to_s
		end
		
		#scrape article title
		publication_link.css('span.tytul').each do |data_link|
            article_names.push data_link.content.strip.tr('\\','').to_s
		end

		#zip the lists together into individual entries, and add to contributions list
		author_names.length.times do |i|
			article = Contribution.new(author_names[i], article_names[i])
			contributions.push(article)
		end

		return edition_name
	end
end