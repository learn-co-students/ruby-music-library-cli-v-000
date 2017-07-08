require 'pry'

class MusicImporter

	attr_reader :path, :library

	def initialize(path)
		@path = path
		@library = []
	end

	def files
		# "./spec/fixtures/mp3s"

		files = Dir.entries(path)
		files.delete(".")
		files.delete("..")

		files
		#binding.pry
	end

	def import
		files = self.files

		files.each do |filename|
			@library << Song.create_from_filename(filename)
		end
	end

	def alphabetize_by_name
		binding.pry
	end
end