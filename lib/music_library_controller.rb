require 'pry'

class MusicLibraryController
  attr_accessor :path 

  def initialize(path = './db/mp3s')
    MusicImporter.new(path).import
  end
  
  def call
    
    puts "Welcome to your music Library"
    input = ""
    while input != "exit"  

      puts "Choose one of the following options:
        list songs, list genres, play song, list artist, list genre, or exit"
      
      input = gets.strip
      if input == "list songs"
        songs
      elsif input == "list artists"
        artists
      elsif input == "list genres"
        genres
      elsif input == "play song"
        play_song
      elsif input == "list artist"
        artist_songs
      elsif input == "list genre"
        genre_songs
      end
    end
  end

  def songs
    Song.all.each_with_index do |song, index|
      puts "#{index + 1}. #{song.artist.name} - #{song.name} - #{song.genre.name}
      "
    end
  end

  def artists
    Artist.all.each_with_index do |artist, index|
      puts "#{index + 1}. #{artist.name}"
    end
  end
 
  def genres
    Genre.all.each_with_index do |genre, index|
      puts "#{index + 1}. #{genre.name}
      "
    end
  end

  def play_song
    puts "What song number would you like to play?"
    song_input = gets.strip
    puts "Playing #{Song.all[song_input.to_i-1].artist.name} - #{Song.all[song_input.to_i-1].name} - #{Song.all[song_input.to_i-1].genre.name}"
  end

  def artist_songs
    puts "What artist would you like to list songs for?"
    artist_input = gets.strip
    if artist = Artist.find_by_name(artist_input)
      artist.songs.each_with_index do |song, index|
        puts "#{index + 1}. #{song.artist.name} - #{song.name} - #{song.genre.name}"
      end
    end
  end

  def genre_songs
    puts "What genre would you like a list of songs for?"
    input = gets.strip
    if genre = Genre.find_by_name(input)
      genre.songs.each_with_index do |song, index|
        puts "#{index + 1}. #{song.artist.name} - #{song.name} - #{song.genre.name}"
      end
    end
  end
  
end



