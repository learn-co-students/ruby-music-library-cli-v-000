class Artist

  attr_accessor :name, :song
  attr_reader :artist

  @@all = []
  extend Concerns::Findable

  def initialize(name)
    @name = name
    @song = song
    @songs = []

  end

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end


  def add_song(song)
    @songs << song unless @songs.include?(song)
    song.artist = self unless song.artist
  end

  def songs
    @songs
  end

  def genres
    genres = []
    @songs.each do |song|
    genres << song.genre if !genres.include?(song.genre)
  end
  genres
  end
end
