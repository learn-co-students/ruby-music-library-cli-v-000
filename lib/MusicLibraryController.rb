require 'pry'

class MusicLibraryController

  attr_accessor :importer, :path

  def initialize(path = './db/mp3s')
    @path = path
    @importer = MusicImporter.new(@path)
    @importer.import
  end

  def call
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
    if input == 'list songs'
      self.list_songs
    elsif input == 'list artists'
      self.list_artists
    elsif input == 'list genres'
      self.list_genres
    elsif input == 'list artist'
      self.list_songs_by_artist
    elsif input == 'list genre'
      self.list_songs_by_genre
    elsif input == 'play song'
      self.play_song
    elsif input != 'exit'
      self.call
    else input == 'exit'
    end
  end

  def list_songs
    sorted_array = Song.all.sort {|x,y| x.name <=> y.name}
    sorted_array.each_with_index do |song,i|
      puts "#{i+1}. #{song.artist.name} - #{song.name} - #{song.genre.name}"
    end
  end

  def list_artists
    sorted_array = Artist.all.sort {|x,y| x.name <=> y.name}
    sorted_array.each_with_index do |artist,i|
      puts "#{i+1}. #{artist.name}"
    end
  end

  def list_genres
    sorted_array = Genre.all.sort {|x,y| x.name <=> y.name}
    sorted_array.each_with_index do |genre,i|
      puts "#{i+1}. #{genre.name}"
    end
  end

  def list_songs_by_artist
    puts "Please enter the name of an artist:"
    input = gets.strip
    i = 1
    sorted_array = Song.all.sort {|x,y| x.name <=> y.name}
    sorted_array.each do |song|
      if song.artist.name == input
        puts "#{i}. #{song.name} - #{song.genre.name}"
        i+=1
      end
    end
  end

  def list_songs_by_genre
    puts "Please enter the name of a genre:"
    input = gets.strip
    i = 1
    sorted_array = Song.all.sort {|x,y| x.name <=> y.name}
    sorted_array.each do |song|
      if song.genre.name == input
        puts "#{i}. #{song.artist.name} - #{song.name}"
        i+=1
      end
    end
  end

  def play_song
    puts "Which song number would you like to play?"
    input = gets.strip
    x = input.to_i - 1
    sorted_array = Song.all.sort {|x,y| x.name <=> y.name}
      if x >= 0 && x <= Song.all.length + 1 && sorted_array[x] != nil
        song = sorted_array[x]
        puts "Playing #{song.name} by #{song.artist.name}"
      end
  end

end
