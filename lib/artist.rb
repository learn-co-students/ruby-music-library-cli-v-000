
class Artist
  attr_accessor :name

  @@all = []

  def initialize(name)
    @name = name
    @@all << self
    @songs = []
  end

  def self.all
    @@all
  end

  def self.destroy_all
    @@all.clear
  end

  def save
    @@all << name
  end

  def self.create(created_artist)
    created_artist = Artist.new(created_artist)
    created_artist.save
    created_artist
  end

  def songs
    @songs
  end

  def add_song(song)
    if (song.artist.nil?)
      @songs << song
      song.artist = self
    end
  end



end
