
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
    self.all.clear
  end

  def save
    self.class.all << self
  end

  def self.create(name)
    artist = Artist.new(name)
    artist.save
    artist
  end

  def songs
    @songs
  end

  def add_song(song)
    unless song.artist
      song.artist = self
    end
    unless @songs.include?(song)
      @songs << song
    end
  end

  def genres
    self.songs.collect{ |song| song.genre }.uniq
  end

end
