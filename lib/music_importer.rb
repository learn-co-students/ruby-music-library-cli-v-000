

class MusicImporter
	attr_accessor :path
	def initialize(path)
		@path = path
		
	end
	def files
		files = Dir.entries(@path)
		files = files.select { |x| x.include?(".mp3")}
		@all = files.collect{ |x| x.gsub(/.mp3/, "")}
		files
	end
	
	def all
		@all
	end
	def import
		self.files.each do |x| 
			song = Song.create_from_filename(x) 
			song
		end
	end
	
end