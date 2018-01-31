class MusicImporter

	attr_accessor :path 

	def initialize(path)
		@path = path
	end

	def files
		song_list = Dir.glob("#{@path}/*")
		song_list.collect {|s| File.basename(s)}
	end

	def import
		files.collect {|song| Song.create_from_filename(song)}
	end



end
