class Genre
  attr_accessor :name, :songs
  @@all = []
  extend Concerns::Findable

  #class methods
  def initialize(name)
    @name = name
    @songs =[]
  end
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

  #instance methods
  def save
    self.class.all << self
  end
  def add_song(song)
    song.genre = self if song.genre == nil
    self.songs << song if self.songs.include?(song) == false
  end
  def artists
    artist_array = []
    self.songs.collect do |song|
      artist_array << song.artist if artist_array.include?(song.artist) == false
    end
    artist_array
  end
end
