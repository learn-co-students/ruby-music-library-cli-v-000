require 'pry'

class MusicLibraryController
  attr_accessor :path
  
  def initialize(path="./db/mp3s")
    MusicImporter.new(path).import
  end

  def call
    answer = ""

    while answer != "exit"
      puts "\nEnter one of the following actions or 'q' to exit\n\n"
      puts "Play - Play a song"
      puts "Artist - View songs by artist"
      puts "Genre - View songs by genre"
      puts "Songs - View all songs"
      puts "List Artists - View a list of artists"
      puts "List Genres - View a list of genres\n\n"

      answer = gets.strip.downcase
      puts
      exit if answer == "q" 
      
      case answer
      when "play"
        play_song
      when "artist"
        songs_by_artist
      when "genre"
        songs_by_genre
      when "songs"
        list_songs
      when "list artists"
        list_artists 
      when "list genres"
        list_genres
      end
    end
  end

  def list_songs
    Song.all.each_with_index do |song, i| 
      puts "#{i+1}. #{song.artist.name} - #{song.name} - #{song.genre.name}"
    end
  end

  def list_artists
    Artist.all.each_with_index { |artist, i| puts "#{i+1}. #{artist.name}"}
  end

  def list_genres
    Genre.all.each_with_index { |genre, i| puts "#{i+1}. #{genre.name.capitalize}"}
  end

  def play_song
    list_songs 
    puts "\nEnter the song number you would like to play:"
    answer = gets.strip.to_i-1

    if answer < 100
      puts "\nPlaying: #{Song.all[answer].artist.name} - #{Song.all[answer].name} - #{Song.all[answer].genre.name}"
    else
      puts "\nInvalid song number"
    end
  end

  def songs_by_artist
    list_artists
    puts "\nEnter an artists name to view a list of their songs:"
    artist_name = gets.strip.downcase

    artist_songs = [] 
    Song.all.each do |song| 
      artist_songs << song if song.artist.name.downcase == artist_name
    end

    if artist_songs == []
      puts "\nArtist not found"
    else
      puts "\n#{artist_name.split.map(&:capitalize).join(' ')}'s Songs:\n\n"
      print_songs(artist_songs)
    end
  end

  def songs_by_genre
    list_genres
    puts "\nEnter a genre:"
    genre_name = gets.strip.downcase
    
    genre_songs = [] 
    Song.all.each do |song|
      genre_songs << song if song.genre.name.downcase == genre_name 
    end

    if genre_songs == []
      puts "\nArtist not found"
    else
      puts "\n#{genre_name.capitalize} Songs:\n\n"
      print_songs(genre_songs)
    end
  end

  def print_songs(songs)
    songs.each { |song| puts "  #{song.artist.name} - #{song.name}"}
  end
end
