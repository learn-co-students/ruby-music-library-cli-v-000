class MusicImporter

	attr_accessor :path

	def initialize(path)
		@path = path
	end

	def files
		@files ||= Dir.glob("#{self.path}/*.mp3").collect do |x|
			x.gsub(/\..+mp3s\//,"")
		end
	end

	def import
		self.files.each do |filename|
			Song.create_from_filename(filename)
		end
	end


end

# rspec spec/010_music_importer_spec.rb