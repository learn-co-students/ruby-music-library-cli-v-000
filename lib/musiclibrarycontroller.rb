class MusicLibraryController


    def initialize(path='./db/mp3s')
        MusicImporter.new(path).import
    end

    def call
        input = nil
        i = 0
        until input == "exit" || i == 4
        
           puts "Welcome to your music library!"
           puts "To list all of your songs, enter 'list songs'."
           puts "To list all of the artists in your library, enter 'list artists'."
           puts "To list all of the genres in your library, enter 'list genres'."
           puts "To list all of the songs by a particular artist, enter 'list artist'."
           puts "To list all of the songs of a particular genre, enter 'list genre'."
           puts "To play a song, enter 'play song'."
           puts "To quit, type 'exit'."
           puts "What would you like to do?"
       
           input = gets.chomp
           i += 1
           
           case input
           when 'list songs'
               list_songs
           when 'list artists'
               list_artists
           when 'list genres'
               list_genres
           when 'list artist'
               list_songs_by_artist
           when 'list genre'
               list_songs_by_genre
           when 'play song'
               play_song
           end
           
        end
    end

## sort helpers found at bottom       
    def list_songs
       sort_songs(Song).each.with_index {|song, index| puts "#{index + 1}. #{song.artist.name} - #{song.name} - #{song.genre.name}"}
    end
    
    def list_artists
        sort_songs(Artist).each.with_index(1) {|item, index| puts "#{index}. #{item.name}"}
    end
    
    def list_genres
       sort_songs(Genre).each.with_index(1) {|item, index| puts "#{index}. #{item.name}"}
    end
    
    def list_songs_by_artist
       puts "Please enter the name of an artist:"
       input = gets.chomp()
       
       artist = Artist.find_by_name(input)
       if artist
           sort_songs_by(artist).each.with_index(1) {|item, index| puts "#{index}. #{item.name} - #{item.genre.name}"}
       end
    end

    def list_songs_by_genre
       puts "Please enter the name of a genre:"
       input = gets.chomp()
       
       genre = Genre.find_by_name(input)
       if genre
           sort_songs_by(genre).each.with_index(1) {|item, index| puts "#{index}. #{item.artist.name} - #{item.name}"}
       end
    end

    def play_song
        puts "Which song number would you like to play?"
        a = sort_songs(Song)
        input = gets.chomp.to_i - 1
        puts "Playing #{a[input].name} by #{a[input].artist.name}" if input >= 0 && input < a.length
    end
 
 
 ## sort helpers   
    def sort_songs(klass)
       klass.all.sort {|a, b| a.name.downcase <=> b.name.downcase}
    end
    
    def sort_songs_by(arg)
        arg.songs.sort_by {|i| i.name}
    end

end
