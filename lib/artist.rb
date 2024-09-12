class Artist
  extend Concerns::Findable

  attr_accessor :name
  attr_reader :songs
  @@all =[]


  def initialize(name)
    @name = name
    @songs = []
  end

  def self.all
    @@all
  end

  def add_song(song)
    song.artist = self unless song.artist
    @songs<<song unless songs.include?(song)
  end

  def songs
    @songs
  end

  def genres
    self.songs.collect {|songs| songs.genre}.uniq
  end

  def save
    self.class.all<<self
  end

  def self.destroy_all
    self.all.clear
  end

  def self.create(name)
    artist = Artist.new(name)
    artist.save 
    artist
  end
end
