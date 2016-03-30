

class MusicLibraryController
	def initialize(path)
		import = MusicImporter(path)
		import
	end
	
end