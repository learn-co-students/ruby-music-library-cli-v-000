class MusicImporter

	attr_reader :path, :files

	def initialize(path)
		@path = path
	end

	def files
		@files = Dir.glob(File.join(@path, "*"))
		@files= @files.map{|e| e.split("/")[-1]}
	end

	def import
		files.each{|a| Song.create_from_filename(a)}
	end

end