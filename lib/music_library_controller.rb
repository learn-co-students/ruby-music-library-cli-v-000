require 'pry'
class MusicLibraryController

  attr_accessor :file_path, :files

  def initialize(file_path = "./db/mp3s")
    @file_path = file_path
    music_importer = MusicImporter.new(file_path)
    music_importer.import
    @files = music_importer.files
  end

  def call
    input = ""
    while input != "exit"
      puts "Welcome to Music CLI"
      puts "Please enter one of the following"
      puts "1. list songs"
      puts "2. list artists"
      puts "3. list genres"
      puts "4. play song"
      puts "5. list artist"
      puts "6. list genre"
      input = gets.strip
      case input
      when "list songs"
        list_songs
      when "list artists"
        list_artists
      when "list genres"
        list_genres
      when "play song"
        play_song
      when "list artist"
        list_artist
      when "list genre"
        list_genre
      end
    end
  end

  def list_songs
    files.each.with_index(1) do |song,i|
      puts "#{i}. #{song}"
    end
  end

  def list_artists
    Artist.all.each.with_index(1) do |artist,i|
      puts "#{i}. #{artist.name}"
    end
  end

  def list_genres
    Genre.all.each.with_index(1) do |genre,i|
      puts "#{i}. #{genre.name}"
    end
  end

  def play_song
    puts "Please input the song number"
    number = gets.strip
    files.each.with_index(1) do |song,i|
      puts "Playing #{song}" if i == number.to_i
    end
  end

  def list_artist
    puts "Please input the Artist name"
    artist = gets.strip
    Artist.find_by_name(artist).songs.each do |song|
    #  binding.pry
      puts "#{artist} - #{song.name} - #{song.genre.name}"
    end
  end

  def list_genre
    puts "Please input the Genre name"
    genre = gets.strip
    Genre.find_by_name(genre).songs.each do |song|
    #  binding.pry
      puts "#{song.artist.name} - #{song.name} - #{genre}"
    end
  end

end
