require_relative 'contribution'

# File created 05/04/2020
# ------------------------------------
# Class to describe a course including number,
# name, syllabus, and credits.
class Book
	attr_accessor :author, :title, :description, :year

	# Initializes single Book
	#   (string) author
    #	(string) title
    #   (string) description
	def initialize author, title, description, year
        @author = author
        @title = title
		@description = description
		@year = year
	end

	def to_s
		print "-" + @author + ", " + @title + "\n" + @description + "\n\n"
    end
	def to_csv
		a = @author.delete "\n\t"
		t = @title.delete "\n\t"
		d = @description.delete "\n\t"
		csv_string = "\"" + @year + "\",\"" + a +"\",\"" + t + "\",\"" + d + "\"\n"
		return csv_string
	end
end 