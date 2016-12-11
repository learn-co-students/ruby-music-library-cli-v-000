require 'pry'

class MusicLibraryController

  def initialize(path = "./db/mp3s")
    musicimporter = MusicImporter.new(path)
    musicimporter.import
  end

  def call
    input = ""
    while input != "exit"
      puts "Hello, what would you like to do with your music library?"
      input = gets.strip
      if input == "list songs"
        list_songs
      elsif input == "list artists"
        list_artists
      elsif input == "list genres"
        list_genres
      elsif input == "play song"
        play_song
      elsif input == "list artist"
        list_artist
      elsif input == "list genre"
        list_genre
      end
    end
  end

  def list_songs
    Song.all.each.with_index(1) do |song, index|
      puts "#{index}. #{song.artist.name} - #{song.name} - #{song.genre.name}"
    end
  end

  def list_artists
    Artist.all.each do |artist|
      puts "#{artist.name}"
    end
  end

  def list_genres
    Genre.all.each do |genre|
      puts "#{genre.name}"
    end
  end

  def play_song
    puts "Pick a song to play"
    s_input = gets.strip
    song = Song.all[s_input.to_i-1]
    puts "Playing #{song.artist.name} - #{song.name} - #{song.genre.name}"
  end

  def list_artist
    puts "What artist do you choose?"
    a_input = gets.strip
    artist = Artist.find_by_name(a_input)
    artist.songs.each do |song|
      puts "#{artist.name} - #{song.name} - #{song.genre.name}"
    end
  end

  def list_genre
    puts "What genre do you choose?"
    g_input = gets.strip
    genre = Genre.find_by_name(g_input)
    genre.songs.each do |song|
      puts "#{song.artist.name} - #{song.name} - #{genre.name}"
    end
  end


end
