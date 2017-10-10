class Artist

  attr_accessor :name, :artist, :genre

  @@all = []
  extend Concerns::Findable

  def initialize(name)
    @name = name
    #@artist = artist
    @genre = genre
    @songs = []
    @genres = []

  end

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end


  def add_song(song)
    #binding.pry
    @songs << song unless @songs.include?(song)
    song.artist = self unless song.artist
  end

  def songs
    @songs
  end

  def genres
    @song.artist = self
    @genres << self
  end


end
