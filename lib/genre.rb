class Genre
  extend Concerns::Findable
  attr_accessor :name
  # attr_reader :artist
  @@all = []
  def initialize(name)
    @name = name
    @songs = []
  end
  def self.all
    @@all
  end
  def self.destroy_all
    self.all.clear
  end
  def save
    self.class.all << self
  end
  def self.create(name)
    name = Genre.new(name)
    name.save
    name
  end
  def songs
    @songs
  end
  def artists
    #iterate over the songs collection and set each song to the artist
    #use .uniq to return a collection of undublicated songs
    songs.collect{|song| song.artist}.uniq
  end
end
