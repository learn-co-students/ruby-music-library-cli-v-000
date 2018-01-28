
class Genre

  extend Concerns::Findable

  attr_accessor :name, :artist, :songs

  @@all = []

  def initialize(name)
    @name = name
    self.save
    @songs = []
  end

  def save
    @@all << self
  end

  def self.create(name)
    self.new(name)
  end

  def self.all
    @@all
  end

  def self.destroy_all
    @@all = []
  end

  def songs
    @songs
  end

  def artists
    artists_array = []
    self.songs.each do |song|
      if !artists_array.include?(song.artist)
        artists_array << song.artist
      end
    end
    artists_array
  end

end
