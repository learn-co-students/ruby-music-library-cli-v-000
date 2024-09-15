class MusicImporter
	attr_accessor :path
	def initialize(path)
		@path = path
	end

	def files
		 @files ||= Dir.glob("#{path}/*.mp3").collect{ |file| file.gsub("#{path}/", "")}.sort
	end

	def import
		files.each do |file_name|
			Song.new_from_filename(file_name)
		end	
	end
end