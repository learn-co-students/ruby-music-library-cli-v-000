require 'pry'

class MusicLibraryController

  def initialize(path = "./db/mp3s")
    MusicImporter.new(path).import
  end

  def call
    puts "Welcome. Please enter a command"
    commands
  end

  def commands
    loop do
      input = gets.chomp
      if input == "list songs"
        list_songs
      elsif input == "list artists"
        list_artists
      elsif input == "list genres"
        list_genres
      elsif input == "play song"
        play_song
      elsif input == "play artist songs"
        list_artist_songs(artist)
      elsif Artist.find_by_name(input) #if the input matches the name of an artist this line will be valid (and below), and it will list
        list_artist_songs(input)
      elsif Genre.find_by_name(input)
        list_genre_songs(input)
      elsif input == "exit"
        break
      else
        puts "ERROR"
      end
    end
  end

  def list_songs
    song_number = 0
    Song.all.collect do |song|
      puts "#{song_number += 1}. #{song.artist.name} - #{song.name} - #{song.genre.name}"
    end
  end

  def list_artists
    Artist.all.each {|artist| puts artist.name}
  end

  def list_genres
    Genre.all.each {|genre| puts genre.name}
  end

  def play_song
    puts "Please pick the song number:"
    list_songs
    input = gets.to_i
    if Song.all.count >= input
      puts "Playing #{Song.all[input - 1].artist.name} - #{Song.all[input - 1].name} - #{Song.all[input - 1].genre.name}"
    elsif Song.all.count < input
      puts "Invalid command. Please pick a song."
      list_songs
      play_song
    end
  end

  def list_artist_songs(artist)
    puts "Here are all the songs by #{artist}:"
    Artist.find_by_name(artist).songs.each{|song| puts "#{song.artist.name} - #{song.name} - #{song.genre.name}"}
  end

  def list_genre_songs(genre)
    puts "Here are all the songs by #{genre}:"
    Genre.find_by_name(genre).songs.each{|song| puts "#{song.artist.name} - #{song.name} - #{song.genre.name}"}
  end

end
