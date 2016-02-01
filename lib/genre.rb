class Genre
  attr_accessor :name, :song, :artist
  extend Concerns::Findable

  @@all = []

  def initialize(name)
    @name = name
    @songs = []
  end

  def self.all
    @@all
  end

  def self.destroy_all
    @@all.clear
  end

  def save
    @@all << self
  end

  def self.create(name)
    newgenre = Genre.new(name)
    newgenre.save
    newgenre
  end

  def songs
    @songs
  end

  def add_song(song)
    @songs << song if @songs.include?(song) == false
    song.genre = self if song.genre == nil
  end

  def artists
    genreartists = []
    @songs.each {|song| genreartists << song.artist}
    genreartists.uniq
  end

end