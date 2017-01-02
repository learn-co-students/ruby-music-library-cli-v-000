class Artist
  attr_accessor :name, :songs, :genres
  @@all = []
  extend Concerns::Findable

  #class methods
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
  def self.create(name)
    artist = self.new(name)
    artist.save
    artist
  end

  #instance methods
  def save
    self.class.all << self
  end
  def add_song(song)
    song.artist = self if song.artist == nil
    self.songs << song if self.songs.include?(song) == false
  end
  def genres
    genre_array = []
    self.songs.collect do |song|
      genre_array << song.genre if genre_array.include?(song.genre) == false
    end
    genre_array
  end
end
