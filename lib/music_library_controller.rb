class MusicLibraryController

	def initialize(path="./db/mp3s")
		@path = path
		music_imp = MusicImporter.new(path)
		music_imp.import
	end

	def call
    response = nil
    while response != "exit"
    	print "What would you like to do?"
    	response = gets.chomp
			case response
			when "list songs"
				i=1
				Song.all.each do |song|
					print "#{i}. #{song.artist.name} - #{song.name} - #{song.genre.name}"
					i+=1
				end
			when "list artists"
				Song.all.each do |song|
					print "#{song.artist.name}"
				end
			when "list genres"
				Song.all.each do |song|
					print "#{song.genre.name}"
				end
			when "play song"
				Song.all.each do |song|
					print "Playing #{song.artist.name} - #{song.name} - #{song.genre.name}"
				end
			when "list artist"
				Song.all.each do |song|
					print "Playing #{song.artist.name} - #{song.name} - #{song.genre.name}"
				end
			when "list genre"
				Song.all.each do |song|
					print "Playing #{song.artist.name} - #{song.name} - #{song.genre.name}"
				end
			end
		end
	end

end
