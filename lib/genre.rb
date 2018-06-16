class Genre
  extend Concerns::Findable

  attr_accessor :name
  attr_reader :songs
  @@all =[]

  def initialize(name)
    @name = name
    @songs =[]
end

  def self.all
    @@all
  end

  def songs
    @songs
  end

  def artists
    self.songs.collect {|songs| songs.artist}.uniq
  end

  def save
    self.class.all<<self
  end

  def self.destroy_all
    self.all.clear
  end

  def self.create(name)
    genre = Genre.new(name)
    genre.save
    genre
  end
end
