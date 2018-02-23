class MusicImporter
	attr_accessor :path

	def initialize(path)
		@path = path
	end

	def files
		Dir.entries(self.path).delete_if{|entry| entry.length < 3}
	end

	def import
		self.files.each do |filename|
			Song.create_from_filename(filename)
		end
	end

end 
