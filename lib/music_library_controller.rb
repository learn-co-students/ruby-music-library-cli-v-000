require 'pry'
class MusicLibraryController

  # accepts an optional path to the library of MP3 files, defaulting to ./db/mp3s/
  # instantiate a MusicImporter object

  attr_accessor :path, :files, :library

  def initialize(path="./db/mp3s")
    @path = path
    MusicImporter.new(path).import
    @library = []
  end

  def library
    @library
  end

  def call
    while input != "exit"
    puts "Welcome to your music library!"
    puts "To list all of your songs, enter 'list songs'."
    puts "To list all of the artists in your library, enter 'list artists'."
    puts "To list all of the genres in your library, enter 'list genres'."
    puts "To list all of the songs by a particular artist, enter 'list artist'."
    puts "To list all of the songs of a particular genre, enter 'list genre'."
    puts "To play a song, enter 'play song'."
    puts "To quit, type 'exit'."
    puts "What would you like to do?"

    input = gets.strip.downcase

    if input != "exit"
      self.call
    end
  end

  def list_songs
    #alpha = []
      Song.all.each do |song|
      self.library << [song.artist.name, song.name, song.genre.name]
      end
      self.library.sort!{|a,b| a[1] <=> b[1]}.each.with_index(1) do |song_parts, index|
        puts "#{index}. #{song_parts.join(" - ")}"
      end
  end


  def list_artists
   alpha = []
     Artist.all.each do |artist|
       alpha << artist.name
     end
     alpha.sort!.each.with_index(1) do |name, index|
       puts "#{index}. #{name}"
     end
  end

  def list_genres
    alpha = []
    list = []
    Genre.all.each do |genre|
      alpha << genre.name
    end
    alpha.sort!.each.with_index(1) do |name, index|
      list << "#{index}. #{name}"
      puts "#{index}. #{name}"
    end
  end

  def list_songs_by_artist
    puts "Please enter the name of an artist:"
    input = gets.strip.downcase.split(/ |\_/).map(&:capitalize).join(" ")
    alpha = []
    list = []
    Artist.all.each do |artist|
      if artist.name == input
        artist.songs.each do |song|
        alpha << [song.name, song.genre.name]
        end
      else
        nil
      end
    end
    alpha.sort!{|a,b| a[0] <=> b[0]}.each.with_index(1) do |song_parts, index|
      list << "#{index}. #{song_parts.join(" - ")}"
      puts "#{index}. #{song_parts.join(" - ")}"
    end
  end

  #def list_songs_by_genre
  #  puts "Please enter the name of a genre:" #prompts user
  #  input = gets.strip #gets input
  #  if genre = Genre.find_by_name(input)
  #    genre.songs.sort_by(&:name).each.with_index(1) do |sn, idx|
  #      puts "#{idx}. #{sn.artist.name} - #{sn.name}"
  #    end
  #  end
  #end

  def list_songs_by_genre
    puts "Please enter the name of a genre:"
    input = gets.strip.downcase
  #  alpha = []
  #  list = []
    if genre = Genre.find_by_name(input)
      genre.songs.sort_by(&:name).each.with_index(1) do |song, index|
        puts "#{index}. #{song.artist.name} - #{song.name}"
      end
    end
  end
          #alpha.sort!{|a,b| a[1] <=> b[1]}.each.with_index(1) do |song_parts, index|
          #  list << "#{index}. #{song_parts.join(" - ")}"
          #  puts "#{index}. #{song_parts.join(" - ")}"
          #end

  def play_song
    puts "Which song number would you like to play?"
    input = gets.strip.to_i
    binding.pry
    if input.between?(1, Song.all.length)
      played_song = self.library[input-1]
      puts "Playing #{played_song.name} by #{played_song.artist.name}"
    end
  end

  def play_song
    puts "Which song number would you like to play?"
    input = gets.strip.to_i #gets input, converts to the string to an integer
    if (1..Song.all.length).include?(input)
      song = Song.all[input] #matches input by index
    end
    puts "Playing #{song.name} by #{song.artist.name}" if song #prints the matching song
    #checks for 1 - all songs
  end
end # class end
