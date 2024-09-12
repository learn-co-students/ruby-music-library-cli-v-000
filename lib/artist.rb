class Artist
  extend Concerns::Findable
  attr_accessor :name
  attr_reader :songs
  @@all=[]

  def initialize(name)
    @name=name
    @songs=[]
  end

  def self.all
    @@all
  end

  def self.destroy_all
    @@all.clear
  end

  def save
    @@all<<self
    self
  end

  def self.create(name)
    artist=self.new(name)
  end

  def self.create(artist)
    artist=Artist.new(artist)
    artist.save
    artist
  end

  def add_song(song)
    song.artist=self unless song.artist==self
    @songs<<song unless @songs.include?(song)
  end

  def songs
    @songs
  end

  def genres
    @songs.collect{|song| song.genre}.uniq
  end

end
