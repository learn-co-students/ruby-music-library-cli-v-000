class MusicLibraryController

	attr_accessor :path

	def initialize(path="./db/mp3s")
		@path = path
		libaray = MusicImporter.new(self.path)
    libaray.import
	end

	def call 
		until (user_input = gets.chomp) == "exit"
			user_input
			# if user_input = "list songs"
			#   Song.all.each_with_index do |song, index|
			#   	song_name = song.name
			# 	  artist_name = song.artist.name
			# 	  genre_name = song.genre.name
			#     puts "#{index + 1}. #{artist_name} - #{song_name} - #{genre_name}"
			#   end  
			# end
		end
	end

end