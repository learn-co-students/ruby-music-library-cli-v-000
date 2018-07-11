class Song
  attr_accessor :name, :artist
  @@all = []

  def artist=(artist)
    @artist = artist
  end

  def initialize(name, artist = nil)
    @name = name
    self.artist = artist
  end



  def self.all
    @@all
  end

  def save
    @@all << self
  end

  def self.destroy_all
    @@all.clear
  end

  def self.create(name)
    created_song = Song.new(name)
    created_song.save
  end

end
