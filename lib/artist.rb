
class Artist
  extend Concerns::Findable
  attr_accessor :name

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
    artist = self.new(name)
    artist.save
    artist
  end

  def add_song(song)
    if !@songs.include?(song)
      @songs << song
    end
    song.artist = self unless song.artist
  end

  def songs
    @songs
  end

  def genres
    genres = []
    self.songs.collect do |song|
      genres << song.genre
    end
    genres.uniq
  end

end
