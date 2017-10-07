class Artist
  attr_accessor :name
  @@all = []

  def initialize(name)
    @name = name
    @songs = []
  end

  def self.all
    @@all
  end

  def self.destroy_all
    self.all.clear
  end

  def save
    self.class.all << self
  end

  def self.create(name)
    new_object = self.new(name)
    new_object.save
    new_object
  end

  def songs
    @songs
  end

  def add_song(song)
    if song.artist == nil
     song.artist = self
     self.songs << song
    end
  end
end
