class Genre
  attr_accessor :name

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
    genre = self.new(name)
    genre.save
    genre
  end

  def add_song(song)
    @songs << song unless @songs.include?(song)
  end

  def songs
    @songs
  end

  def artists
    @songs.map do |song|
      song.artist
    end.uniq
  end

  def to_s
    self.name
  end
end
