# ------------------------------------
# Class to describe a contribution by
# author, and article title
class Contribution
    attr_accessor :author, :article

	# Initializes single Publication
    #   (string) author
    #   (string) article
	def initialize author, article
        @author = author
        @article = article
    end
    
    #method to display as a string to the console
    def to_s
        print @author + ": " + @article
    end

    #method to convert contribution to a csv formatted line
    #(helper method for Publicaiton.entry_to_csv)
    def to_csv
        csv_string = "\"" + @author + "\",\"" + @article + "\"\n"
        return csv_string
    end
end 