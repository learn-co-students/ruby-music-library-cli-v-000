class Song
  attr_accessor :artist, :genre, :name
  @@all = []
  def initialize(name, genre = nil, artist = nil)
    @name = name
    if artist
      self.artist = artist
    end
    if genre
      self.genre = genre
    end
  end

  def self.all
    @@all
  end
  def self.destroy_all
    @@all = []
  end

  def save
    @@all << self
  end

  def self.create(name)
    new_song = self.new(name)
  end

end
