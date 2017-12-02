require 'pry'

class MusicLibraryController
  extend Concerns::Findable

  attr_accessor :path, :file

  def initialize(path = './db/mp3s')
    @path = path
    @file = MusicImporter.new(@path).import
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
    input = gets.chomp
    until input == "exit"
      case input
      when "list songs"
        self.list_songs
      when "list artists"
        self.list_artists
      when "list genres"
        self.list_genres
      when "list artist"
        self.list_songs_by_artist
      when "list genre"
        self.list_songs_by_genre
      when "play song"
        self.play_song
      when "exit"
        input = "exit"
      end
     input = gets.chomp
    end
  end

def list_songs
  @file.map! {|each_file| each_file.split(" - ")}
  @file.sort! {|a,b| a[1]<=>b[1]}
  @file.each {|each_file| each_file[2] = each_file[2].split(".")[0] }
  @file.map! {|each_file| each_file.join(" - ")}
  @file.each_with_index.collect {|each_file, index| puts "#{index + 1}. #{each_file}" }
end

def list_artists
  Artist.all.sort! { |a,b| a.name <=> b.name }
  Artist.all.each_with_index  {|artist, index|  puts "#{index + 1}. #{artist.name}"}
end

def list_genres
  Genre.all.sort! { |a,b| a.name <=> b.name }
  Genre.all.each_with_index  {|genre, index|  puts "#{index + 1}. #{genre.name}"}
end

def list_songs_by_artist
  puts "Please enter the name of an artist:"
  user_input = gets.chomp
  Artist.all.each do |artist|
      if artist.name == user_input
       artist.songs.sort! { |a,b| a.name <=> b.name }
       artist.songs.each_with_index {|song, index| puts "#{index + 1}. #{song.name} - #{song.genre.name}"}
      end
    end
end

def list_songs_by_genre
  puts "Please enter the name of a genre:"
  user_input = gets.chomp
  Genre.all.each do |genre|
      if genre.name == user_input
       genre.songs.sort! { |a,b| a.name <=> b.name }
       genre.songs.each_with_index {|song, index| puts "#{index + 1}. #{song.artist.name} - #{song.name}"}
      end
    end
end

def play_song
  puts "Which song number would you like to play?"
  user_input = gets.chomp
  @file.each_with_index do |song, index|
     if (index + 1) == user_input.to_i
       song_name = song.split(" - ")[1]
       song_artist = song.split(" - ")[0]
       puts "Playing #{song_name} by #{song_artist}"
    end
  end
 end
end
