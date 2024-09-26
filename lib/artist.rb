class Artist
  attr_accessor :name, :songs, :genre
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
    newartist = Artist.new(name)
    newartist.save
    newartist
  end

  def songs
    @songs
  end

  def add_song(song)
    @songs << song if @songs.include?(song) == false
    song.artist = self if song.artist == nil
  end

  def genres
    artistgenres = []
    @songs.each {|song| artistgenres << song.genre}
    artistgenres.uniq
  end

end
