class MusicLibraryController
    
    def initialize(path="./db/mp3s")
        MusicImporter.new(path).import
    end
    
    def call
        input = ""
        while input != "exit"
            "Welcome! What do you want to do?"
            input = gets.chomp
            case input
                when "list songs"
                    self.list_songs
                when "list artists"
                    self.list_artists
                when "list genres"
                    self.list_genres
                when "list artist"
                    self.list_artist
                when "list genre"
                    self.list_genre
                when "play song"
                    play_song                    
            end
        end
    end
    
    def sort_songs
        Song.all.sort_by {|song| song.name}.sort_by {|song| song.artist.name}
    end
    
    def list_songs
        self.sort_songs.each_with_index do |song, index| 
            puts "#{index+1}. #{song.artist.name} - #{song.name} - #{song.genre.name}"
        end
    end
    
    def list_artists
       Artist.all.sort_by{|artist| artist.name}.each_with_index do |artist, index|
          puts "#{index+1}. #{artist.name}" 
       end
    end
    
    def list_genres
       Genre.all.sort_by{|genre| genre.name}.each_with_index do |genre, index|
          puts "#{index+1}. #{genre.name}" 
       end
    end    
    
    def play_song
        puts "Please enter a song number"
        song_num = gets.strip.to_i - 1
        song = self.sort_songs[song_num]
        #binding.pry
        puts "Playing #{song.artist.name} - #{song.name} - #{song.genre.name}"
    end
    
    def list_artist
        puts "Please enter an artist name to see their songs"
        artist_name = gets.strip
        artist = Artist.find_by_name(artist_name) 
        artist.songs.each {|song| puts "#{artist.name} - #{song.name} - #{song.genre.name}"}
    end
    
    def list_genre
        puts "Please enter a genre name to see its songs"
        genre_name = gets.strip
        genre = Genre.find_by_name(genre_name) 
        genre.songs.each {|song| puts "#{song.artist.name} - #{song.name} - #{genre.name}"}
    end    
end