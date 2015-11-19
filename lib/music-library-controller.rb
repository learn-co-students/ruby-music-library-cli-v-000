require 'pry'

class MusicLibraryController
  attr_accessor :path
  
  def initialize(path="./db/mp3s")
    MusicImporter.new(path).import
  end

  def call
    answer = ""

    while answer != "exit"
      puts "\nChoose one of the following actions or enter 'q' to exit\n\n"
      puts "Play - Play a song"
      puts "Artist - Search by artist to view a list of thier songs"
      puts "Genre - Seach songs by genre"
      puts "Songs - View a list of songs"
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
    puts "\nPlaying: #{Song.all[answer].artist.name} - #{Song.all[answer].name} - #{Song.all[answer].genre.name}"
  end

  def songs_by_artist
    list_artists
    puts "\nEnter the artists name to see a list of their songs:"
    artist_name = gets.strip.downcase

    puts "\n#{artist_name.split.map(&:capitalize).join(' ')}'s Songs:\n\n"
    Song.all.each do |song|
      if song.artist.name.downcase == artist_name
        puts "  #{song.name}" 
      end
    end
  end

  def songs_by_genre
    list_genres
    puts "\nEnter a genre to list all of their songs:"

    genre_name = gets.strip.downcase
    puts "\n#{genre_name.capitalize} Songs:\n\n"

    Song.all.each do |song|
      if song.genre.name.downcase == genre_name 
        puts "  #{song.artist.name} - #{song.name}"
      end
    end
  end
end