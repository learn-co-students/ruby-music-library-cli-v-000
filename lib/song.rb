require 'pry'
class Song

  attr_accessor :name
  attr_reader :artist, :genre

  extend Concerns::Findable

  @@all = []

  def initialize(name, artist = nil, genre = nil)
    @name = name
    @@all << self
    genre.add_song(self) unless genre.nil?
    artist.add_song(self) unless artist.nil?
    #spply artist to artist
  end

  def self.all 
    @@all   
  end

  def self.destroy_all
    self.all.clear
  end

  def save
    @@all << self
  end

  def self.create(name)
    song = Song.new(name)
    song.save
    song
  end

  def artist=(artist, stop = nil)
    @artist = artist
    artist.add_song(self)
  end

  def genre=(genre, stop = nil)
    @genre = genre
    genre.add_song(self) 
  end


  def self.new_from_filename(filename)
    split_file = filename.split(" - ")
    artist = Artist.find_or_create_by_name(split_file[0])
    genre = Genre.find_or_create_by_name(split_file[2].gsub(/\.mp3/, ""))
    song = Song.new(split_file[1], artist, genre)
    song
  end

  def self.create_from_filename(filename)
    split_file = filename.split(" - ")
    artist = Artist.find_or_create_by_name(split_file[0])
    genre = Genre.find_or_create_by_name(split_file[2].gsub(/\.mp3/, ""))
    song = Song.new(split_file[1], artist, genre)
    song
  end


end