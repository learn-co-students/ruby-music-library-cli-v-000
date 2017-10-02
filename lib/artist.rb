class Artist
  extend Concerns::Findable
  attr_accessor :name, :songs
  @@all = []

  def self.all
    @@all
  end

  def initialize(name)
    @name = name
    @songs = []
  end

  def songs
    @songs
  end

  def self.destroy_all
    @@all.clear
  end

  def save
    @@all << self
  end

  def self.create(artist_name)
    artist = self.new(artist_name)
    artist.save
    artist
  end

  def add_song(song)
    @songs << song unless @songs.include?(song)
    song.artist = self unless song.artist == self
  end

  def genres
    genres = self.songs.collect {|song| song.genre}
    genres.uniq
  end
end
