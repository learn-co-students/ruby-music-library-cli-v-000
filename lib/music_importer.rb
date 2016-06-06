class MusicImporter

	attr_accessor :path, :files
	
	def initialize(file_path)
		@path = file_path
	end
	
	def files
		@files = Dir.entries(@path).select {|x| x.include?(".mp3")}
	end
	
	def import
		self.files.each {|filename| Song.create_from_filename(filename)}
	end
	
end
		
