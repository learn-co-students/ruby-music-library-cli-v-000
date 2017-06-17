class Genre
  attr_accessor :name, :songs, :artists
  @@all = []

  def initialize(name)
    @name = name
    @songs = []
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
    self.new(name).save
    self
  end

  def add_song(song)
    self.songs.include?(song) || @songs << song
    #self.artists
  end

end
