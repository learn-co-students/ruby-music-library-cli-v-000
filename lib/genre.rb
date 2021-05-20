class Genre
  extend Concerns::Findable

  attr_accessor :name

  @@all = [ ]

  def initialize(name)
    @name = name
    @songs = [ ]
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
    genre = new(name)
    genre.save
    genre
  end

  def songs
    Song.all.select{|s|s.genre == self}
  end

  def artists
    songs.collect{|s|s.artist}.uniq
  end

end
