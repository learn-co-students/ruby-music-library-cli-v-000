class MusicImporter

	attr_accessor :path, :files
	
	def initialize(file_path)
		@path = file_path
	end
	
	def files
		@files = Dir.entries(self.path).select {|x| x.include?(".mp3")}
		@files.sort_by{|word| word.downcase} #Took hours to figure out why this was happening
	end
	
	def import
		self.files.each {|filename| Song.create_from_filename(filename)}
	end
	
end
		
