require 'pry'
class MusicImporter
	attr_accessor :path, :mp3s

	def initialize(path)
		@path = path
	end

	def files
		files= Dir.entries(@path)
		@mp3s = files.select {|file| file.scan(/(.+.mp3\b)/) != []}	
	end


	def import
		@mp3s =files
		files.each do |filename| 
			song = Song.new_from_filename(filename)
			Song.all << song
		end
		files
	end
end