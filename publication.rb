# File created 04/06/2020
# ------------------------------------
# Class to describe a course including number,
# name, syllabus, and credits.
class Publication
	# Initializes single Publication
	#   (string) edition
	#	(array) contents
	def initialize edition, contents
		@edition = edition
		@contents = contents
	end
end 