class Genre

  extend Concerns::Findable
  attr_accessor :name

  @@all = []

  def initialize(name)
    @name = name
    @songs = []
  end

  def songs
    @songs
  end

  def self.all
    @@all
  end

  def self.destroy_all
    self.all.clear
  end

  def save
    @@all << self

  end

  def self.create(name)
    genre = Genre.new(name)
    genre.save
    genre

  end

  def artists
      songs.collect{ |s| s.artist}.uniq
  end




end #Genre class
