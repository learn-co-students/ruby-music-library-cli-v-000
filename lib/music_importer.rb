class MusicImporter

	attr_accessor :path

	def initialize(path)
		@path = path
	end

	def files
		Dir.entries(@path).reject {|item| File.directory?(item)}
	end

	def import
		self.files.each do |file|
			Song.create_from_filename(file)
		end
	end

end