class MusicImporter

	attr_accessor :path

	def initialize(path)
		@path = path
	end

	def files
		files = Dir.glob("#{path}**/*")
		files = files.collect{|file|file.scan(/(?<=mp3s\/)(.*)/)}.flatten #disgusting RegEx that matches everything after the path
	end

	def import
		new_files = self.files
		new_files.each do |file|
			new_song = Song.create_from_filename(file)
		end

	end

end
