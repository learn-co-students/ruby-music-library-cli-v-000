class Artist

  attr_accessor :name, :artist, :genre

  @@all = []
  extend Concerns::Findable

  def initialize(name)
    @name = name
    @artist = artist
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
    if @songs.include?(song)
      @songs
    else
      @songs << song
    end
    if song.artist
      nil
    else
      song.artist = self
    end
  end

  def songs
    @songs
  end

  def genres
    @song.artist = self
    @genres << self
  end


end
