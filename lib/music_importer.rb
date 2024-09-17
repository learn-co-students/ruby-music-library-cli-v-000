class MusicImporter
	attr_accessor :path 

	def initialize(path)
		@path = path
	end

	def files
		folder = Dir.glob("#{@path}/*.mp3")
		folder.collect {|filename| filename.slice!("#{path}/")}
		folder
	end

	def import
		self.files.each {|file| Song.create_from_filename(file)}
	end

end