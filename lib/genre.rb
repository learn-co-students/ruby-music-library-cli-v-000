class Genre
  attr_accessor :name
  attr_reader :songs

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
    self.new(name).tap do |genre|
    genre.save
    end
  end

  def artists
    songs.collect do |song|
      song.artist
    end.uniq
  end
end
