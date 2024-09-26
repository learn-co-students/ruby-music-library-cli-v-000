class MusicLibraryController

	def initialize(path = "./db/mp3s")
		importer = MusicImporter.new(path)
		importer.import
	end

	def call
		input = gets.strip
		if input == "list songs"
			Song.all.each_with_index do |song, index|
				puts "#{index+1}. #{song.to_s}"
			end
		end
	end
end
