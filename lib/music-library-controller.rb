require 'pry'

class MusicLibraryController
#learn --fail-fast
  def initialize(path="./db/mp3s")
    @path = path
    controller = MusicImporter.new(path)
    controller.import
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
    user_input = gets.chomp
      case user_input
      when "list songs"
        list_songs
      when "list artists"
        list_artists
      when "list genres"
        list_genres
      when "list artist"
        list_songs_by_artist
      when "list genre"
        list_songs_by_genre
      when "play song"
        play_song
      when "exit"
        nil
      else call
    end 
  end

  def list_songs
    sorted_songs = Song.all.sort {|a, b| a.name <=> b.name}
    sorted_songs.each_with_index do |song, index|
      puts "#{index + 1}. #{song.artist.name} - #{song.name} - #{song.genre.name}"
    end
  end

  def list_artists
    sorted_artists = Artist.all.sort {|a , b| a.name <=> b.name}
    sorted_artists.each_with_index do |artist, index|
      puts "#{index + 1}. #{artist.name}"
    end
  end

  def list_genres
    sorted_genres = Genre.all.sort {|a , b| a.name <=> b.name}
    sorted_genres.each_with_index do |genre, index|
      puts "#{index + 1}. #{genre.name}"
    end
  end

  def list_songs_by_artist
    puts "Please enter the name of an artist:"
    user_input = gets.chomp
    matching_artist = Artist.all.find{|artist_obj| artist_obj.name == user_input}
    if matching_artist
      songs_array = matching_artist.songs.sort{|a, b| a.name <=> b.name}
      songs_array.each_with_index { |song_obj, index|
        puts "#{index + 1}. #{song_obj.name} - #{song_obj.genre.name}"
      }
    end
  end

  def list_songs_by_genre
    puts "Please enter the name of a genre:"
    user_input = gets.chomp
    matching_genre = Genre.all.find{|genre_obj| genre_obj.name == user_input}
    if matching_genre
      songs_array = matching_genre.songs.sort{|a, b| a.name <=> b.name}
      songs_array.each_with_index { |song_obj, index|
        puts "#{index + 1}. #{song_obj.artist.name} - #{song_obj.name}"
      }
    end
  end

  def play_song
    puts "Which song number would you like to play?"
    user_input = gets.to_i
    if user_input > 0 && user_input <= Song.all.length
      sorted_songs = Song.all.sort {|a, b| a.name <=> b.name}
      selected = sorted_songs[user_input - 1]
       puts "Playing #{selected.name} by #{selected.artist.name}"
    end
  end

end
