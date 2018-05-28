
class MusicImporter
	attr_accessor :path, :files
	def initialize(filepath)
		@path = filepath
	end

	def files
		@files ||= Dir.glob("#{path}/*.mp3").collect{ |f| f.gsub("#{path}/", "")}
	end

	def import
		files.collect {|file| song = Song.create_from_filename(file)}
	end
end
