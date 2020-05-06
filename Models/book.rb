# ------------------------------------
# Class to describe a book by
# author, title, book description, and publication year
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

	#method to display as a string to the console
	def to_s
		print "-" + @author + ", " + @title + "\n" + @description + "\n\n"
	end
	
	#method to convert book to a csv formatted line
	def to_csv
		a = @author.delete "\n\t"
		t = @title.delete "\n\t"
		d = @description.delete "\n\t"
		csv_string = "\"" + @year + "\",\"" + a +"\",\"" + t + "\",\"" + d + "\"\n"
		return csv_string
	end
end 