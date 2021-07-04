class Artist
  extend Concerns::Findable
  attr_accessor :name, :songs


  @@all = []

  def initialize(name)
    @name = name
    @songs = []
  end

  def genres
    #returns a collection of genres for all of the artist's songs and remove duplicate entries
    songs.collect(&:genre).uniq
  end


  def self.all
    @@all
  end

  def self.destroy_all
    all.clear
  end

  def save
    @@all << self
  end

  def self.create(name)
    new_artist = new(name)
    new_artist.save
    new_artist
  end

  def add_song(song)
    song.artist = self unless song.artist
    songs << song unless songs.include?(song)
  end

end
