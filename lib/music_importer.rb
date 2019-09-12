class MusicImporter
	attr_accessor :path

	@@all = []

	def initialize(path)
		@path = path
	end

	def files
		arr = Dir.entries(path)
		arr[2..arr.size]
	end

	def import
		self.files.each do |file|
			Song.create_from_filename(file)
		end
	end

end