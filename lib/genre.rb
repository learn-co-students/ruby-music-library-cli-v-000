class Genre
  extend Concerns::Findable
  attr_accessor :name
  attr_reader :songs

  def initialize(name)
    @name = name
    @songs = []
  end

  @@all = []

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
    Genre.new(name).tap do |genre|
      genre.save
    end
  end

  def artists
    songs.collect { |s| s.artist }.uniq
  end

end
