class MusicLibraryController
attr_accessor :path
  def initialize(path='./db/mp3s')
    @path = path
    MusicImporter.new(path).import
  end


  def call
    puts "Welcome to your music library!"
    puts "To list all of your songs, enter 'list songs'."
    puts "To list all of the artists in your library, enter 'list artists'."
    puts "To list all of the genres in your library, enter 'list genres'."
    puts "To list all of the songs by a particular artist, enter 'list artist'."
    puts "To list all of the songs of a particular genre, enter 'list genre'."
    puts "To play a song, enter 'play song'."
    puts "To quit, type 'exit'."
    puts "What would you like to do?"

     4.times do
        response = gets.strip
        list_songs if response == "list songs"
        list_artists if response == "list artists"
        list_genres if response == "list genres"
        list_songs_by_artist if response == "list artist"
        list_songs_by_genre if response == "list genre"
        play_song if response == "play song"
      end
  end

    #CLI METHODS

    def list_songs
      songs_sorted = Song.all.sort_by {|song| song.name}
      songs_sorted.each_with_index {|song, index| puts "#{index + 1}. #{song.artist.name} - #{song.name} - #{song.genre.name}"}
    end

    def list_artists
      artists_sorted = Artist.all.sort_by {|artist| artist.name}
      artists_sorted.each_with_index {|artist, index| puts "#{index + 1}. #{artist.name}"}
    end

    def list_genres
      genres_sorted = Genre.all.sort_by {|genre| genre.name}
      genres_sorted.each_with_index {|genre, index| puts "#{index + 1}. #{genre.name}" }
    end

    def list_songs_by_artist
        puts "Please enter the name of an artist:"
        artist_name = gets.strip
        artist = Artist.find_by_name(artist_name)
        if artist
          songs_sorted = artist.songs.sort_by {|song| song.name}
          songs_sorted.each_with_index {|song, index| puts "#{index + 1}. #{song.name} - #{song.genre.name}" }
        end
      end

    def list_songs_by_genre
      puts "Please enter the name of a genre:"
      genre_name = gets.strip
      genre = Genre.find_by_name(genre_name)
      if genre
        songs_sorted = genre.songs.sort_by {|song| song.name}
        songs_sorted.each_with_index {|song, index| puts "#{index + 1}. #{song.artist.name} - #{song.name}" }
      end
    end

    def play_song
      puts "Which song number would you like to play?"
      song_number = gets.strip
      if song_number.to_i.to_s == song_number && 1 <= song_number.to_i && song_number.to_i <= Song.all.length
        index = song_number.to_i - 1
        alphabetized = Song.all.sort_by {|song| song.name}
        song = alphabetized[index]
        if song
          puts "Playing #{song.name} by #{song.artist.name}"
        end
      end

    end


end
