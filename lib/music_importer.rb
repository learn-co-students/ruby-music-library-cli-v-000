class MusicImporter

	def initialize(filepath)
		@path = filepath
	end

	def path
		@path
	end

	def files
		@files = Dir.entries(@path).select! {|f| f.include?('mp3')}
	end

	def import
		files
		@files.each do |file|
			Song.create_from_filename(file)
		end
	end

end