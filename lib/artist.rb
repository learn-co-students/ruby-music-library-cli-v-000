
class Artist
  extend Concerns::Findable

  attr_accessor :name, :songs
  

  @@all = []

  def initialize(name)
    @name = name
    @songs = []
  end

  def self.all
    @@all
  end

  def self.destroy_all
    @@all = []
  end

  def save
    @@all << self
  end

  def self.create(name)
    created_artist = Artist.new(name)
    created_artist.save
    created_artist
  end

  def add_song(song)
    song.artist = self if song.artist != self
    @songs << song if !songs.include?(song)
  end

  def genres
    genre_collection = songs.collect {|song| song.genre }
    genre_collection.uniq
  end

end
