require_relative 'contribution'

# ------------------------------------
# Class to describe an individual publication of Kultura by
# edition number, articles contained (as contributions), and publication year 
class Publication
	attr_accessor :edition, :contents, :year

	# Initializes single Publication
	#   (string) edition
	#	(list) contents
	def initialize edition, contents, year
		@edition = edition
		@contents = contents
		@year = year
	end

	#method to display as a string to the console
	def to_s
		print @edition + ":"
		contents.length.times do |i|
			article = @contents[i]
			print "\n\t- "
			print article.to_s
		end
		print "\n\n"
	end

	#method to convert a contribution from the publication to a full csv formatted line
	def entry_to_csv index
		csv_string = "\"" + @year + "\",\"" + @edition + "\"," + contents[index].to_csv
		return csv_string
	end
end 