#SongArtist module
module SongArtists
  module InstanceMethods
    def save
      self.class.all<<self
    end
  end

  module ClassMethods

    def create(name)
      new_instance = self.new(name)
      new_instance.save
      self.all[0]
    end

    def destroy_all
      self.all.clear
    end
  end
end

#findable module
module Concerns::Findable
  def find_by_name(name)
    self.all.detect{|a| a.name == name}
  end

  def find_or_create_by_name(name)
    if self.find_by_name(name) == nil
      new_a = self.create(name)
    else
      return self.find_by_name(name)
    end
  end

end



#song class
class Song
  attr_accessor :name
  include SongArtists::InstanceMethods
  extend SongArtists::ClassMethods


  @@all = []

  def initialize(name, artist = nil, genre = nil)

    @name = name
    if genre != nil
      self.genre = genre
    end
    if artist != nil
      self.artist = artist
    end
  end

  def self.all
    @@all
  end

  def artist=(artist)
    @artist = artist
    if Artist.all.include?(self)
      @artist.add_song(self)
    end
  end

  def artist
    if @artist!=nil
      @artist
    else
      return nil
    end
  end

  def genre=(genre)
    @genre = genre
    if !@genre.songs.include?(self)
      @genre.songs<<self
    end
  end

  def genre
    @genre
  end

  def self.find_by_name(name)
    self.all.detect{|song| song.name == name}
  end

  def self.find_or_create_by_name(name)
    if self.find_by_name(name) == nil
      new_song = self.create(name)
    else
      return self.find_by_name(name)
    end
  end

  def self.new_from_filename(file_name)
    string_array = file_name.gsub(/.mp3/, '')
    new_string = string_array.split(" - ")
    new_song = Song.find_or_create_by_name(new_string[1])
    new_song.artist = Artist.find_or_create_by_name(new_string[0])
    new_song.genre = Genre.find_or_create_by_name(new_string[2])
    new_song
  end

  def self.create_from_filename(file_name)
    self.new_from_filename(file_name)
  end

end

#artist class
class Artist
  attr_accessor :name, :songs
  include SongArtists::InstanceMethods
  extend SongArtists::ClassMethods
  extend Concerns::Findable

  def initialize(name)
    @name = name
    @songs = []
  end

  @@all = []

  def self.all
    @@all
  end

  def add_song(song)
    if song.artist == nil
      song.artist = self
    end
    if !self.songs.include?(song)
      self.songs << song
    end
  end

  def genres
    genre_array = self.songs.collect {|song| song.genre}
    genre_array.uniq
  end
end

#Genre class
class Genre
  attr_accessor :name, :songs
  include SongArtists::InstanceMethods
  extend SongArtists::ClassMethods
  extend Concerns::Findable

  @@all = []

  def initialize(name)
    @name = name
    @songs = []
  end

  def self.all
    @@all
  end

  # def songs=(song)
  #   if !@songs.include?(song)
  #     @songs<<song
  #   end
  # end

  def artists
    artists_array = self.songs.collect{|song|song.artist}
    artists_array.uniq
  end
end

#MusicImporter class
class MusicImporter
  attr_accessor :path

  def initialize(path)
    @path = path
  end

  def files
    file_name_array = Dir.entries(self.path)
    file_name_array.collect do |file|
      if !file.include?(".mp3")
        file_name_array.delete(file)
      end
    end
    file_name_array
  end

  def import
    self.files.collect do |file|
      Song.create_from_filename(file)
    end
  end
end

#musiclibrarycontroller class
class MusicLibraryController
  attr_accessor :path, :files

  def initialize(path = "./db/mp3s")
    @path = path
    new_a = MusicImporter.new(path)
    @files = new_a.files
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

    input = nil
    until input == "exit"
      input = gets.strip
    end
  end

  def list_songs
    self.files.collect!.with_index do |song,i|
      puts "#{i+1}. #{song.gsub(".mp3","")}"
    end
  end

  binding.pry


end
