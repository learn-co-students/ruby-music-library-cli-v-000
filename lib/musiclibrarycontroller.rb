require "colorize"

class MusicLibraryController
  attr_accessor :path

  def initialize(path = "./db/mp3s")
    @path = path
    music_importer = MusicImporter.new(path)
    music_importer.import
  end


  def call
    puts "Welcome to your music library!" #.blue.on_red.blink
    puts "To list all of your songs, enter 'list songs'."
    puts "To list all of the artists in your library, enter 'list artists'."
    puts "To list all of the genres in your library, enter 'list genres'."
    puts "To list all of the songs by a particular artist, enter 'list artist'."
    puts "To list all of the songs of a particular genre, enter 'list genre'."
    puts "To play a song, enter 'play song'."
    puts "To quit, type 'exit'."
    user_input = ""
    until user_input == "exit"
      puts "What would you like to do?"
      user_input = gets.chomp
      if user_input == "list songs"
        list_songs
      end
      if user_input == "list artists"
        list_artists
      end
      if user_input == "list genres"
        list_genres
      end
      if user_input == "list artist"
        list_songs_by_artist
      end
      if user_input == "list genre"
        list_songs_by_genre
      end
      if user_input == "play song"
        play_song
      end
    end
  end

  def list_songs
    Song.all.sort_by{|song| song.name}.each_with_index do |song, i|
      puts "#{i + 1}. #{song.artist.name} - #{song.name} - #{song.genre.name}"
    end
  end

  def list_artists
    Artist.all.sort_by{|artist| artist.name}.each_with_index do |artist, i|
      puts "#{i + 1}. #{artist.name}"
    end
  end

  def list_genres
    Genre.all.sort_by{|genre| genre.name}.each_with_index do |genre, i|
      puts "#{i + 1}. #{genre.name}"
    end
  end

  def list_songs_by_artist
    puts "Please enter the name of an artist:"
    user_artist = gets.chomp
    if Artist.find_by_name(user_artist) != nil
      artist = Artist.find_by_name(user_artist)
      artist.songs.sort_by{|song| song.name}.each_with_index do |song, i|
      puts "#{i + 1}. #{song.name} - #{song.genre.name}"
     end
    end
  end

  def list_songs_by_genre
    puts "Please enter the name of a genre:"
    user_genre = gets.chomp
    if Genre.find_by_name(user_genre) != nil
      genre = Genre.find_by_name(user_genre)
      genre.songs.sort_by{|song| song.name}.each_with_index do |song, i|
      puts "#{i + 1}. #{song.artist.name} - #{song.name}"
     end
    end
  end

  def play_song
    puts "Which song number would you like to play?"
    user_song = gets.chomp
    index_number = user_song.to_i - 1
    if index_number >= 0 && index_number < Song.all.length
      song_collection = Song.all.sort_by{|song| song.name}  #array = ["cat", "dog"]  |   array[0]
      song = song_collection[index_number]
      puts "Playing #{song.name} by #{song.artist.name}"
   end
  end

end
