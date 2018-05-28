class Song

  attr_accessor :name, :artist, :genre

  @@all = []

  def initialize(name, artist="")
    @name = name
    @artist = artist
    self.class.all << self
  end

  # Class Methods

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
    song = Song.new(name)
    song.save
    song
  end

  # Instance Methods



end
