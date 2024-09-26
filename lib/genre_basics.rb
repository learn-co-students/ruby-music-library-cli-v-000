class Genre
  extend Concerns::Findable
  
  attr_accessor :name
  attr_reader :songs

  @@all = []

  def self.all
    @@all
  end

  def self.destroy_all
    self.all.clear
  end

  def self.create(name)
      genre = self.new(name)
      genre.save
      genre
  end

  def initialize(name)
    @name = name
    @songs = []
  end

  def save
    self.class.all << self if !self.class.all.include?(self)
  end

  def artists
    self.songs.collect {|song|
      song.artist
    }.uniq
  end

end
