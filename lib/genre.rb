class Genre
  attr_accessor :name, :artist, :songs
  attr_reader :genre

  extend Concerns::Findable

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
    artist = Genre.new(name)
    artist.save
    artist
  end

  def artists
    @songs.collect {|songs| songs.artist}.uniq
  end
end
