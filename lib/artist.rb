class Artist
  extend Concerns::Findable

  attr_accessor :name
  attr_reader :songs
  @@all = []

  def initialize(name)
    @name = name
    @songs = []           # creates a 'songs' property set to an empty array (artist has many songs)
  end

  def self.all
    @@all
  end
  def self.destroy_all
    @@all.clear
  end
  def self.create(name)   # initializes and saves the artist
    new(name).tap{ |a| a.save }
  end

  def save                # adds the Artist instance to the @@all class variable
    @@all << self
  end
  def songs               # returns the artist's 'songs' collection (artist has many songs)
    @songs
  end
  def add_song(song)
    song.artist = self unless song.artist
    songs << song unless songs.include?(song)
  end
  def genres
    songs.collect { |song| song.genre }.uniq      # returns a collection of genres ; does not return duplicate genres ; collects genres through its songs
  end
end
