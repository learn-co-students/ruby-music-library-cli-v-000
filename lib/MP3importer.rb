class MusicImporter
	attr_reader :path

	def initialize(path = "../db/mp3s")
		@path = path
	end

	def files
		directory = Dir.glob("#{path}/*.mp3")
		files = directory.map { |file| file.gsub("#{path}/", "") }	
	end

	def import
		files.each {|file| Song.create_from_filename(file)}
	end

end
