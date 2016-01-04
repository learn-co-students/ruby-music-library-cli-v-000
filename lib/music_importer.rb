class MusicImporter
	attr_accessor :path

	def initialize(path)
		@path = path
	end

	def files
		files = Dir["#{@path}/*mp3"]
		normalized = files.map {|file| file.split("/").last}
	end

	def import
		self.files.map {|file| Song.create_from_filename(file)}
	end
end
