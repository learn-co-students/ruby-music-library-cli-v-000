class Genre
  extend Concerns::Create_Destroy
  extend Concerns::Findable

  attr_accessor :name
  attr_reader :songs
  @@all = []  # stores genre instances

  def initialize(name)
    @name = name
    @songs = []  # instances of songs
  end

  def self.all  # self is the Genre class; returns the array of all genre instances
    @@all
  end

  def save
    @@all << self  # self is the genre instance; adds the genre instance to the @@all array
  end

  def artists
    songs.collect {|song| song.artist}.uniq  # iterates over the songs array, returning the artist property for each song instance; uniq method removes duplicate values
  end

end