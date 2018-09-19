require 'pry'

class Song

  attr_accessor :name, :artist, :genre

  @@all = []

  def self.all
    @@all
  end

  def self.find_by_name(name)
    # binding.pry. this is where im stuck
    self.all.select do |song|
      song.name == name
    end
  end

  def find_or_create_by_name
  end

  def initialize(name, artist = nil, genre = nil)
    @name = name
    @@all << self
      if artist == nil
       @artist = artist
      elsif artist != nil
       self.artist = artist
     end
      self.genre = genre unless genre == nil
  end

  def save
    @@all << self
  end

  def self.destroy_all
    @@all.clear
  end

  def self.create(name)
    self.new(name)
  end

  def artist=(artist)
    @artist = artist
    artist.add_song(self)
  end

  def genre=(genre)
    @genre = genre
    @genre.songs << self unless @genre.songs.include?(self)
    # genre.add_song(self)
    # self.genre = genre
    # genre.add_song(self)
  end

end
