# File created 04/06/2020
# ------------------------------------
# Class to describe a course including number,
# name, syllabus, and credits.
class Contribution
    attr_accessor :author, :article

	# Initializes single Publication
    #   (string) author
    #   (string) article
	def initialize author, article
        @author = author
        @article = article
    end
    
    def to_s
        print @author + ": " + @article
    end

    def to_csv
        csv_string = "\"" + @author + "\",\"" + @article + "\"\n"
        return csv_string
    end
end 