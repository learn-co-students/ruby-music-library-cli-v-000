
#Referenced Labs
# ttt-5-move-rb-v-000

require_relative './musicimporter.rb'

class MusicLibraryController

  def initialize(path="./db/mp3s")
    #puts "path = #{path}"
    temp = MusicImporter.new(path)
    temp.import
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

    user_input = gets.strip

    if user_input != "exit"
      if user_input == "list songs"
        list_songs
      elsif user_input == "list artists"
        list_artists
      elsif user_input == "list genres"
        list_genres
      elsif user_input == "list artist"
        list_songs_by_artist
      elsif user_input == "list genre"
        list_songs_by_genre
      elsif user_input == "play song"
        play_song
      end
      call
    end
  end

  def list_songs
    #puts "List Songs"
    #puts "song count = #{Song.all.count}"
    # Song.all.each do |song|
    #   puts "#{song.artist.name} - #{song.name} - #{song.genre.name}"
    # end
    temp = Song.alphabetical
    i = 0
    temp.each do |song|
      i += 1
      puts "#{i}. #{song.artist.name} - #{song.name} - #{song.genre.name}"
    end
  end

  def list_artists
    #puts "List Artists"
    temp = Artist.alphabetical
    i = 0
    temp.each do |artist|
      i += 1
      puts "#{i}. #{artist.name}"
    end
  end

  def list_genres
    #puts "List Genres"
    temp = Genre.alphabetical
    i = 0
    temp.each do |genre|
      i += 1
      puts "#{i}. #{genre.name}"
    end
  end

  def list_songs_by_artist
    puts "Please enter the name of an artist:"

    user_input = gets.strip

    artist = Artist.find_by_name(user_input)
    if artist != "" && artist != nil
      songs = artist.songs
      alphaSongs = songs.sort_by { |temp| temp.name }
      #puts "Artist = #{artist} || songs = #{songs}"
      i = 0
      alphaSongs.each do |song|
        i += 1
        puts "#{i}. #{song.name} - #{song.genre.name}"
      end
    end
  end

  def list_songs_by_genre
    puts "Please enter the name of a genre:"

    user_input = gets.strip

    genre = Genre.find_by_name(user_input)
    if genre != "" && genre != nil
      songs = genre.songs
      alphaSongs = songs.sort_by { |temp| temp.name }
      i = 0
      alphaSongs.each do |song|
        i += 1
        puts "#{i}. #{song.artist.name} - #{song.name}"
      end
    end
  end

  def play_song
    puts "Which song number would you like to play?"

    user_input = gets.strip.to_i

    if user_input > 0 && user_input < Song.count
      temp = Song.alphabetical
      orderedSongList = []
      temp.each do |song|
        orderedSongList << song
      end
      puts "Playing #{orderedSongList[user_input-1].name} by #{orderedSongList[user_input-1].artist.name}"
    end
  end

end
