class Genre
  extend Concerns::Findable

  attr_accessor :name

  @@all = []

  def initialize(name)
    @name = name
    @@all << self
    @songs = []
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
    if (!self.songs.include?(song))
      @songs << song
    end
  end
  def save
    @@all << self
  end

  def self.create(name)
    genre = Genre.new(name)
  end

  def artists
    @songs.collect{ |s| s.artist }.uniq
  end
end
