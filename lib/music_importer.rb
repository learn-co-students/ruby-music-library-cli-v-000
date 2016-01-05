class MusicImporter

	attr_accessor :path

	def initialize(path)
		@path = path
	end

	def files
		@files = Dir["#{@path}/*"] #returns files in a path
		@files.map do |f|
			f.split("/")[-1]
		end
	end

	def import
		files.each do |f|
			Song.create_from_filename(f)
		end
	end
end
