class MusicImporter
	attr_accessor :path

	def initialize(path='./db/mp3s')
		@path = path
	end

	def files
		files_array = Dir.glob("#{@path}/*.mp3")
		filename_array = files_array.collect {|item| File.basename("#{item}")}
	end

	def import
		files.each do |filename|
			Song.create_from_filename(filename)
		end
	end
end