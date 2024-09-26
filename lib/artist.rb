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

  def save
    @@all << self
  end

  def self.destroy_all
    @@all.clear
  end

  def self.create(artist_name)
    artist = self.new(artist_name)
    artist.save
    artist
  end

  def add_song(song)
    if !@songs.include?(song)
      @songs << song
      song.artist = self if song.artist != self
    end
    self.songs
  end

  def songs
    @songs
  end

  def genres
    array = self.songs.collect {|song| song.genre}
    array.uniq
  end
end