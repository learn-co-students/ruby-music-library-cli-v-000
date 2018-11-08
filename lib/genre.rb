class Genre 
  attr_accessor :name

  @@all = []
  def initialize(name)
    @name = name
    @songs = []
    @@all << self
  end

  def self.all
    @@all
  end

  def save
    @@all << self
  end

  def self.destroy_all
    @@all = []
  end

  def self.create(name)
    song = Genre.new(name)
    song.save
    song
  end

  def songs
    @songs
  end

  def artists
    #binding.pry
    songs.collect{|song|song.artist}.uniq
  end

end
