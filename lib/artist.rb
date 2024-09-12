class Artist
  extend Concerns::Findable

  attr_accessor :name
  @@all = Array.new

  def initialize(name)
    @name = name
    @songs = Array.new
  end

  def self.all
    @@all
  end

  def self.destroy_all
    all.clear
  end

  def save
    @@all << self
  end

  def self.create(artist)
    self.new(artist).tap {|artist| artist.save}
  end

  def songs
    @songs
  end

  def add_song(song)
    @songs.include?(song) ? @songs : @songs << song
    song.artist == nil ? song.artist = self : song.artist
  end

  def genres
    genres = self.songs.collect {|song| song.genre}
    genres.uniq
  end
end
