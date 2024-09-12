require 'pry'

class Artist
  attr_accessor :name, :songs

  extend Concerns::Findable

  @@all = []

  def initialize(name)
    @name = name
    @songs = []
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
    array =[]
    self.songs.each do |song|
      array << song.genre unless array.detect{|genre_object| genre_object == song.genre} 
    end
    array
  end

end





