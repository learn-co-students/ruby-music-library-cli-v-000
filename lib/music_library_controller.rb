class MusicLibraryController
  extend Concerns::Findable
  attr_accessor :path, :music_importer

  def initialize(path = './db/mp3s')
    @music_importer = MusicImporter.new(path)
    music_importer.import
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

    user_input = gets.strip # loop while getting user input

      until user_input == "exit"

        case user_input

          when "list songs"
            list_songs
            user_input = "exit"
          when "list artists"
            list_artists
            user_input = "exit"
          when "list genres"
            list_genres
            user_input = "exit"
          when "list artist"
            list_songs_by_artist
            user_input = "exit"
          when "list genre"
            list_songs_by_genre
            user_input = "exit"
          when "play song"
            play_song
            user_input = "exit"
          else
            puts "I dont understand your response"
            user_input = gets.strip
        end
      end
  end

  def list_songs
    list = Song.all.sort {|a, b| a.name <=> b.name}
    list.each_with_index {|song, index| puts "#{index + 1}. #{song.artist.name} - #{song.name} - #{song.genre.name}"}
  end

  def list_artists
    list = Artist.all.sort {|a, b| a.name <=> b.name}
    list.each_with_index {|artist, index| puts "#{index+1}. #{artist.name}"}
  end

  def list_genres
    list = Genre.all.sort {|a, b| a.name <=> b.name}
    list.each_with_index {|genre, index| puts "#{index+1}. #{genre.name}"}
  end

  def list_songs_by_artist
    puts "Please enter the name of an artist:"
    artist_user_input = gets.strip

    if artist = Artist.find_by_name(artist_user_input)
      songs_by_artist = artist.songs.sort {|a,b| a.name <=> b.name}
      songs_by_artist.each_with_index {|song, index| puts "#{index + 1}. #{song.name} - #{song.genre.name}"}
    end
  end

  def list_songs_by_genre
    puts "Please enter the name of a genre:"
    genre_user_input = gets.strip

    if genre = Genre.find_by_name(genre_user_input)
      songs_by_genre = genre.songs.sort {|a,b| a.name <=> b.name}
      songs_by_genre.each_with_index {|song, index| puts "#{index + 1}. #{song.artist.name} - #{song.name}"}
    end
  end

  def play_song
    puts "Which song number would you like to play?"
    choose_song = gets.strip.to_i
    list = Song.all
    if choose_song <= list.length && choose_song > 0
      list = Song.all.sort{ |a, b| a.name <=> b.name }
      selection = list[choose_song - 1]
      puts "Playing #{selection.name} by #{selection.artist.name}"
    end
  end

end
