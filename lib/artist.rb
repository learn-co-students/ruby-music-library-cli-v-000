

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

  def save
    self.class.all << self
  end

  def self.destroy_all
    self.all.clear
  end

  def self.create(name)
    v = self.new(name)
    v.save
    v
  end

  def songs
    @songs
  end

  def add_song(song)
    song.artist = self unless song.artist != nil # This could be wrong, come back later
    self.songs << song unless self.songs.include?(song)
  end

end
