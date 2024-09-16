require 'pry'
class MusicLibraryController
  attr_reader :path 
  def initialize(path = "./db/mp3s")
    @path = path 
    importer = MusicImporter.new(path).import 
  end 
  
  def call
    input = ""
    until input == "exit"
    puts "Welcome to your music library!"
    puts "To list all of your songs, enter 'list songs'."
    puts "To list all of the artists in your library, enter 'list artists'."
    puts "To list all of the genres in your library, enter 'list genres'."
    puts "To list all of the songs by a particular artist, enter 'list artist'."
    puts "To list all of the songs of a particular genre, enter 'list genre'."
    puts "To play a song, enter 'play song'."
    puts "To quit, type 'exit'."
    puts "What would you like to do?"
    input = gets.strip 
    case input
      when "list songs"
        list_songs
      when "list artists"
        list_artists 
      when "list genres"
        list_genres 
      when "list artist"
        list_songs_by_artist 
      when "list genre"
        list_songs_by_genre 
      when "play song"
        play_song
      when "exit"
    end 
  end
  end
  
  def list_songs 
    num = 0
    sorted_songs = Song.all.sort_by {|song| song.name}
    sorted_songs.each do |song|
      num += 1
       puts "#{num}. #{song.artist.name} - #{song.name} - #{song.genre.name}"
    end 
  end 
  
  def list_artists
    num = 1 
    sorted_artists = Artist.all.sort_by {|artist| artist.name}
    sorted_artists.each do |artist|
      puts "#{num}. #{artist.name}"
      num += 1 
    end 
  end 
  
  def list_genres
    num = 1 
    sorted_genres = Genre.all.sort_by { |genre| genre.name}
    sorted_genres.each do |genre| 
      puts "#{num}. #{genre.name}"
      num += 1
    end 
  end 
  
  def list_songs_by_artist
    puts "Please enter the name of an artist:"
    input = gets.strip
    artist = Artist.find_by_name(input)
    if artist != nil
      num = 1
      sorted_songs = artist.songs.sort_by! {|s| s.name} 
      sorted_songs.each do |song|
        puts "#{num}. #{song.name} - #{song.genre.name}"
        num += 1
      end
    end
  end 
  
  def list_songs_by_genre
     puts "Please enter the name of a genre:"
     input = gets.strip
     genre = Genre.find_by_name(input)
    if genre != nil
      num = 1
      sorted_songs = genre.songs.sort_by! {|s| s.name} 
      sorted_songs.each do |song|
        puts "#{num}. #{song.artist.name} - #{song.name}"
        num += 1
      end
    end
  end
  
  def play_song
      puts "Which song number would you like to play?"
      input = gets.strip.to_i 
        
      if input.between?(1, Song.all.count)
        song_number = input - 1
        song = Song.all.sort{|song1, song2| song1.name <=> song2.name}[song_number]
        puts "Playing #{song.name} by #{song.artist.name}"
      end 
  end 
  
    
  
end 