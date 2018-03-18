class MusicLibraryController
	
	def initialize(path = "./db/mp3s")
    MusicImporter.new(path).import
	end

	
end