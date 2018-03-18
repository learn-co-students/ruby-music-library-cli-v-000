class MusicImporter

	def initialize(filepath)
		@path = filepath
		files
		import
	end

	def path
		@path
	end

	def files
		@files = Dir.entries(@path).select! {|f| f.include?('mp3')}
	end

	def import
		@files.each do |file|
			Song.new_from_filename(file)
		end
	end

end