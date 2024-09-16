class Artist
  attr_accessor :name

  extend Concerns::Findable

  @@all = []

  def initialize(name)
    @name = name
    @songs = []
  end 

  def songs
    @songs
  end

  def add_song(song)
    if song.artist
      nil
    else
      song.artist = self
    end
    if @songs.include?(song)
      nil
    else @songs << song
    end
  end

  def genres
    genres = self.songs.collect do |song|
      song.genre
    end
    genres.uniq
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
    artist = Artist.new(name)
    @@all << artist
    artist
  end
end
