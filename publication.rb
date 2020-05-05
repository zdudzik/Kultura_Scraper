require_relative 'contribution'

# File created 04/06/2020
# ------------------------------------
# Class to describe a course including number,
# name, syllabus, and credits.
class Publication
	attr_accessor :edition, :contents

	# Initializes single Publication
	#   (string) edition
	#	(list) contents
	def initialize edition, contents
		@edition = edition
		@contents = contents
	end

	def to_s
		print @edition + ":"
		contents.length.times do |i|
			article = @contents[i]
			print "\n\t- "
			print article.to_s
		end
		print "\n\n"
	end

	def entry_to_csv index
		csv_string = "\"" + @edition + "\"," + contents[index].to_csv
	end
end 