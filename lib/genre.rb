class Genre
  extend Concerns::Findable

  attr_accessor :name, :songs, :genre, :artist
  @@all = []

  def self.all
    @@all
  end

  def initialize(name)
    @name = name
    @songs = []
  end

  def save
    @@all << self
  end

  def self.create(song)
    new_song = self.new(song)
    new_song.save
    new_song
  end

  def self.destroy_all
    @@all.clear
  end

  def songs
    @songs
  end

  def add_song(song)
    @songs << song
  end

  def artists
    self.songs.collect{|genre| genre.artist}.uniq
  end

end
