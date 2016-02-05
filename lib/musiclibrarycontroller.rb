require 'pry'

class MusicLibraryController

  attr_accessor :path


  def initialize(path ="./db/mp3s")
    @library = MusicImporter.new(path).import
    #library.files
  end

  def call
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
  
  def songs
    Song.all.each_with_index do |song,index|
      puts "#{index+1}. #{song.artist.name} - #{song.name} - #{song.genre.name}"
    end
  end

  def artists
    Artist.all.each do |song|
      puts "#{song.name}"
    end
  end

  def genres
    Genre.all.each do |song|
      puts "#{song.name}"
    end
  end

  def list_artist 
    #puts "Enter an artist name:"
    #artist = gets
    #artist = Artist.find_by_name(artist)
    #artist.songs.each{|a| puts "#{artist.name} - #{a.name} - #{a.genre.name}"}
    
    puts "Enter an artist name:"
    artist = gets
    artist = Artist.find_by_name(artist)
    artist.songs.each do |s| puts "#{artist.name} - #{s.name} - #{s.genre.name}"
    end

    #puts "Which artist's songs would you like to see?"
    #input = gets.strip
    #artist = Artist.find_by_name(input)
    #artist.songs.each do |s|
    # "#{artist.name} - #{s.name} - #{s.genre.name}"
    #end
    
  end

  def list_genre
    puts "Enter an genre:"
    genre = gets
    genre = Genre.find_by_name(genre)
    genre.songs.each{|s| puts "#{s.artist.name} - #{s.name} - #{s.genre.name}"}

  end

  def play_song
    self.songs
    puts "Which song woud you like to play? Hint: use number"
    input = gets.strip.to_i
    Song.all.each_with_index do |song,index|
      if input == index + 1
        puts "Playing #{song.artist.name} - #{song.name} - #{song.genre.name}"
      end
    end
  end
end




