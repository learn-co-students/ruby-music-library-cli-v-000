class Genre

  attr_accessor :name, :genre, :artist

  @@all = []
  extend Concerns::Findable

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

  def add_song(genre)
    @songs << song
    song.genre = self
  end

  def songs
    @songs
  end


end
