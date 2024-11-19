class Genre

extend Concerns::Findable

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
    @@all.clear
  end

  def save
    @@all << self
  end

  def self.create(name)
    new_genre = self.new(name)
    new_genre.save
    new_genre
  end

  def songs
    @songs
  end

  def artists
    artists = []
    @songs.each do |song|
      if !artists.include?(song.artist)
      artists << song.artist
    end
  end
    return artists
  end

end
