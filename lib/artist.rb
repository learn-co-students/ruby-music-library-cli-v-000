class Artist
  attr_accessor :name
  extend Concerns::Findable
  @@all = []
  def initialize(name)
    @name = name
    @songs = []
  end

  def genres
    songs.collect(&:genre).uniq
  end

  def songs
    @songs
  end

  def self.all
    @@all
  end

  def self.destroy_all
    @@all.clear
  end

  def save
    @@all << self
  end

  def self.create(name)
    artist = self.new(name)
    artist.name = name
    @@all << artist
    artist
  end

  def add_song(song)
   song.artist = self unless song.artist
   songs << song unless songs.include?(song)
 end
end
