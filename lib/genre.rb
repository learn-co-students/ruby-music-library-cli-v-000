class Genre
  extend Concerns::Findable
  attr_accessor :name, :songs
  @@all = []

  def self.create(name)
    Genre.new(name)
  end

  def initialize(name)
    @name = name
    @songs = []
    self.save
  end

  def save
    @@all << self
  end

  def self.all
    @@all
  end

  def self.destroy_all
    @@all.clear
  end

  def songs
    @songs
  end

  def add_song(song)
    @songs << song if songs.include?(song) == false
  end

  def artists
    array = self.songs.collect { |s| s.artist }
    array.uniq
  end



end
