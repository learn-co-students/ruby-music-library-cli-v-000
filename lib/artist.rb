class Artist
  extend Concerns::Findable
  
  attr_accessor :artist, :name, :genre

  @@all = []

  def initialize(name)
    @name = name
    @songs = []
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
    artist.save
    artist
  end

  def songs
    @songs
  end

  def add_song(song)
    @songs << song unless @songs.include?(song)
    song.artist = self unless song.artist
  end

  def genres
    genres = self.songs.collect do |song|
      song.genre
    end
    genres.uniq
  end

end
