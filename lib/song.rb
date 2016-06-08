require 'pry'

class Song
  extend Concerns::Findable
  attr_accessor :name
  attr_reader :artist, :genre

  @@all =[]

  def initialize(name, artist="", genre="")
    @name=name
    self.artist=artist unless artist == ""
    self.genre=genre unless genre == ""
  end

  def save
    self.class.all << self
  end

  def genre=(genre)
    @genre = genre
    @genre.add_song(self)
  end


  def artist=(artist)
    @artist = artist
    @artist.add_song(self)
  end

  def self.all
    @@all
  end

  def self.destroy_all
    self.all.clear
  end

  def self.create(name)
    song = self.new(name)
    song.save
    song
  end

  def self.new_from_filename(fname)
    fname.gsub!(/\.mp3\z/, "")
    fname = fname.split(" - ")
    artist = Artist.find_or_create_by_name(fname[0].to_s)
    genre = Genre.find_or_create_by_name(fname[2].to_s)
    song = Song.new(fname[1].to_s, artist, genre)
    song
  end

  def self.create_from_filename(fname)
    song = self.new_from_filename(fname)
    song.save
    song
  end
end
