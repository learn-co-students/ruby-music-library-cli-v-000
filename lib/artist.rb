require'pry'

class Artist
  extend Concerns::Findable
  
  attr_accessor :name, :song, :songs

  @@all = []

  def initialize (name)
    @name = name
    @songs = []
  end

  def songs
    @songs
  end

  def add_song(song)
    @songs<<song unless @songs.include?(song)
    song.artist = self if song.artist!=self
    @songs
  end

  def genres
    genres = @songs.collect{|song|song.genre}
    genres.uniq
  end

  def self.all
    @@all
  end

  def self.destroy_all
    self.all.clear
  end

  def save
    @@all << self
  end

  def self.create(name)
    Artist.new(name).tap{|artist| artist.save}
  end
end
