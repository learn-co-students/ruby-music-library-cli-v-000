require 'pry'

class Artist
  attr_accessor :name, :songs, :genres
  @@all = []

  def initialize(name)
    @name = name
    @songs = []
    @genres = []
    self.save
  end

  def songs
    @songs
  end

  def self.all
    @@all
  end

  def self.destroy_all
    @@all.clear
  end

  def save
    @@all << self
  end

  def self.create(name)
    Artist.new(name)
  end

  def add_song(song)
    song.artist = self unless song.artist == self
    @songs << song unless @songs.detect{|s| s.name == song.name }
  end

  def genres
    self.songs.each do |song|
      @genres << song.genre unless @genres.detect{|genre_object| genre_object.name == song.genre.name} 
    end
    @genres
  end

end





