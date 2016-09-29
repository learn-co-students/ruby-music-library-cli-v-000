require 'pry'
class MusicImporter
    
  attr_accessor :path

	def initialize(path)
		@path = path
	end

	def files
	  Dir["#{self.path}/*mp3"].collect do |file|
      file.gsub("./spec/fixtures/mp3s/", "")	
	  end
	end

	def import

	  self.files.each do |file|
      Song.create_from_filename(file)
	  end
     
	end

end
