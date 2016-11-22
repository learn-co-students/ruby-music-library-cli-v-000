class Artist
  attr_accessor :name
  extend Concerns::Findable
  @@all = []

  def self.create(name)
    artist = Artist.new(name)
    @@all << artist
    artist
  end

  def initialize(name)
    @name = name
    @songs = []
  end

  def songs
    @songs
  end

  def add_song(song)
    @songs << song unless @songs.include?(song)
    song.artist = self unless song.artist == self
  end

  def save
    @@all << self
  end

  def self.all
    @@all
  end

  def self.destroy_all
    @@all.clear
  end

  def genres
    genres = songs.collect {|song| song.genre}
    genres.uniq
  end

end
