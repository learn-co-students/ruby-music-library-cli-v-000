class MusicLibraryController
    
    def initialize(path="./db/mp3s")
        MusicImporter.new(path).import
    end
    
    def call
        puts "Please enter your selection:"
        input = gets.strip
        
        if input == "exit"
            return "Goodbye"
        elsif input == "list songs"
            Song.all.sort{|x,y| x.artist.name <=> y.artist.name}.each_with_index do |this_song, index|
                puts "#{index + 1}. #{this_song.artist.name} - #{this_song.name} - #{this_song.genre.name}"
            end
            call
        elsif input == "play song"
            puts "Enter song number"
            number = gets.strip.to_i
            index = number - 1
            songs = Song.all.sort{|x,y| x.artist.name <=> y.artist.name}
            puts "Playing #{songs[index].artist.name} - #{songs[index].name} - #{songs[index].genre.name}"
            call
        elsif input == "list artists"
            Artist.all.sort{|x,y| x.name <=> y.name}.each do |this_artist|
                puts "#{this_artist.name}"
            end
            call
        elsif input == "list artist"
            puts "Enter artist name"
            artist_name = gets.strip
            artist = Artist.find_by_name(artist_name)
            artist.songs.each do |song|
                puts "#{song.artist.name} - #{song.name} - #{song.genre.name}"
            end
            call
        elsif input == "list genre"
            puts "Enter genre name"
            genre_name = gets.strip
            genre = Genre.find_by_name(genre_name)
            genre.songs.each do |song|
                puts "#{song.artist.name} - #{song.name} - #{song.genre.name}"
            end
            call
        elsif input == "list genres"
            Genre.all.sort{|x,y| x.name <=> y.name}.each do |this_genre|
                puts "#{this_genre.name}"
            end
            call
        else
            puts "I'm sorry, I didn't understand that command."
            call
        end
    end
end