require 'pry'

class MusicLibraryController

  def initialize(path = "./db/mp3s") # set default path
    #test_path = "./spec/fixtures/mp3s"
    music_importer = MusicImporter.new(path)
    music_importer.import
  end

  def call # method invoked from bin/musiclibrary
    input = ""
    while input != "exit"
      puts "Welcome to Your Music Library!"
      puts "What would you like to do?"
      input = gets.strip
      case input
      when "list songs"
        songs
      when "list artists"
        artists
      when "list genres"
        genres
      when "list artist"
        list_artist
      when "list genre"
        list_genre
      when "play song"
        play_song
      end
    end
  end

  def artists # method invoked when user input == "list artists"
    Artist.all.each.with_index(1) do |a, i|
      puts "#{i}. #{a}"
      # the #with_index(1) method takes an optional parameter("1") to offset the starting index of zero
      #binding.pry
    end
  end

  def genres
    Genre.all.each.with_index(1) do |g, i|
      puts "#{i}. #{g}"
    end
  end

  def list_artist
    puts "What artist by name you like to list songs for?"
    artist_input = gets.strip
    if artist = Artist.find_by_name(artist_input)
      artist.songs.each do |s,i| # "s" is song instance that includes artist, genre(s) and song(s)
        puts "#{i}. #{s}" # "i" is not index, puts will output a period(.) before the song or list of songs
        #binding.pry
      end
    end
  end

  def list_genre
    puts "What genre by name you like to list songs for?"
    genre_input = gets.strip
    if genre = Genre.find_by_name(genre_input)
      genre.songs.each do |s,i|
        puts "#{i}. #{s}"
      end
    end
  end

  def play_song
    puts "What song number would you like to play?"
    song_input = gets.strip
    puts "Playing #{Song.all[song_input.to_i-1]}" # convert user input to integer then subtract 1 to get index[0]
    # need to get back to index[0] since we added a "1" at method #each.with_index(1)
    #binding.pry
  end

  def songs
    Song.all.each.with_index(1) do |s, i|
      puts "#{i}. #{s}"
    end
  end
end
