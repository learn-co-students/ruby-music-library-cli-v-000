# require_relative "../config/environment.rb"

class MusicLibraryController
  attr_accessor :path, :library


  def initialize(path = "./db/mp3s")
    @path = path
    MusicImporter.new(path).import
    build_library
  end

  def call
    puts "Hi there. You can list songs, list artists, list genres, play a song, see an artist's songs or see songs by genre"
    input = gets.strip.downcase
      if input == "exit"
        puts "So long."
      else 
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
          artist_songs
        when "list genre"
          genre_songs
        end

      end    
  end


  def build_library
    @library = Song.all.collect{|s| 
      "#{s.artist.name} - #{s.name} - #{s.genre.name}"}
  end

  def list_artists
    puts Artist.all.collect{|a| a.name}
    call
  end

  def list_songs
    counter = 0
    @library.each {|s|
      counter +=1
      puts "#{counter}. #{s}"}
    call
  end

  def list_genres
    puts Genre.all.collect{|g| g.name}
    call
  end

  def play_song
    puts "Which song would you like to hear?"
      song = gets.strip.to_i
      puts "Playing #{@library[song - 1]}"
    call
  end

  def artist_songs
    puts "Whose songs you wanna see?"
      artist = gets.strip
      puts @library.select{|s| s.include?(artist)}
    call
  end

  def genre_songs
    puts "What type of music you wanna hear?"
      genre = gets.strip
      puts @library.select{|s| s.include?(genre)} 
    call
  end



end