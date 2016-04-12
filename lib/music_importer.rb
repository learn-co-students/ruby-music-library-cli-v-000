class MusicImporter
	attr_accessor :path, :files
	def initialize(path)
		@path = path
		@files = []
	end

	def files
		Dir["#{self.path}/*.mp3"].collect {|i| i.split("/").last}
	end

	def import
		files.each do |filename|
			Song.create_from_filename(filename)
		end
	end
end