require 'pry'
class MusicLibraryController

  attr_accessor :path

  def initialize(filepath = './db/mp3s')
    music_import = MusicImporter.new(filepath)
    music_import.import
  end

  def call
    puts "Available commands: 'list song, 'list artists', 'list genres', 'play song','list artist','list genre' 'exit'"
    input = ""
    while input != "exit"
      puts "What would you like to do?"
      input = gets.chomp.downcase
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
      when "exit"
        puts "Now exiting...Have a nice day!"
      else
        puts "Invalid Input"
      end
    end
  end

  def list_songs
    Song.all.each_with_index do|song, index| 
      puts "#{index+1}. #{song.artist.name} - #{song.name} - #{song.genre.name}"
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
    list_songs << "/n"
    puts "Enter the number of the song you wish to play"
    number = gets.chomp.to_i-1
    puts "Playing #{Song.all[number].artist.name} - #{Song.all[number].name} - #{Song.all[number].genre.name}"
  end

  def list_artist
    puts "Enter the artist you wish to view"
    input = gets.chomp
    artist = Artist.find_by_name(input)
    if artist != nil
      artist.songs.each do |song|
        puts "#{song.artist.name} - #{song.name} - #{song.genre.name}"
      end
    else
      puts "Artist not found"
    end
  end

  def list_genre
    puts "Enter the genre you wish to view"
    input = gets.chomp
    genre = Genre.find_by_name(input)
    if genre != nil
      genre.songs.each do |song|
        puts "#{song.artist.name} - #{song.name} - #{song.genre.name}"
      end
    else
      puts "Artist not found"
    end
  end
end