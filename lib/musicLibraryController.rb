require 'pry'

class MusicLibraryController

  attr_accessor :path


  def initialize(path='./db/mp3s')
    @path = path
    new_import = MusicImporter.new(path)
    new_import.import
  end

  def call
    while user_input = gets.chomp do
      puts "Welcome to your music library!"
      puts "To list all of your songs, enter 'list songs'."
      puts "To list all of the artists in your library, enter 'list artists'."
      puts "To list all of the genres in your library, enter 'list genres'."
      puts "To list all of the songs by a particular artist, enter 'list artist'."
      puts "To list all of the songs of a particular genre, enter 'list genre'."
      puts "To play a song, enter 'play song'."
      puts "To quit, type 'exit'."
      puts "What would you like to do?"

      if user_input == 'exit'
        break
      elsif user_input == 'list songs'
        self.list_songs
      elsif user_input == 'list artists'
        self.list_artists
      elsif user_input == 'list genres'
        self.list_genres
      elsif user_input == 'list artist'
        self.list_songs_by_artist
      elsif user_input == 'list genre'
        self.list_songs_by_genre
      elsif user_input == 'play song'
        self.play_song
      end
    end
  end

  def list_songs

  Song.all
    .sort{|a,b| a.name <=> b.name }
    .each_with_index do |song,index|
      puts "#{index+1}. #{song.artist.name} - #{song.name} - #{song.genre.name}"
    end

  end

  def list_artists

    Artist.all
    .sort{|a,b| a.name <=> b.name }
    .each_with_index do |artist,index|
      puts "#{index+1}. " + "#{artist.name}"
    end

  end

  def list_genres
    Genre.all
    .sort{|a,b| a.name <=> b.name }
    .each_with_index do |genre,index|
      puts "#{index+1}. " + "#{genre.name}"
    end
  end

  def list_songs_by_artist
    puts "Please enter the name of an artist:"
    user_input = gets.chomp

    artist = Artist.find_by_name(user_input)
    if artist != nil
      artist.songs
      .sort{|a,b| a.name <=> b.name}
      .each_with_index do |song,index|
        puts "#{index+1}. #{song.name} - #{song.genre.name}"
      end
  end

  end

  def list_songs_by_genre
    puts "Please enter the name of a genre:"
    user_input = gets.chomp

    genre = Genre.find_by_name(user_input)
    if genre != nil
      genre.songs
      .sort{|a,b| a.name <=> b.name}
      .each_with_index do |song,index|
        puts "#{index+1}. #{song.artist.name} - #{song.name}"
      end
    end

  end

  def play_song

    puts "Which song number would you like to play?"
    user_input = gets.chomp

    user_i = user_input.to_i

    if user_i >= 1 && user_i <= Song.all.size
      Song.all
      .sort{|a,b| a.name <=> b.name }
      .each_with_index { |song,index|
         index = index + 1
         puts "Playing #{song.name} by #{song.artist.name}" if index == user_i
       }
      end
   end

end
