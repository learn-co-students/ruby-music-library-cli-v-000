class MusicImporter
	
	attr_accessor :path 
	
	def initialize(path)
		@path = path
	end
	
	def files
		Dir.entries(path).select {|f| !File.directory? f}
	end
	
	def import
		files.collect {|file| Song.create_from_filename(file)}
	end
	
end