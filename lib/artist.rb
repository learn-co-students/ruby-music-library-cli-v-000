
class Artist

  extend Concerns::Findable

  attr_accessor :name, :songs

  @@all = []

  def initialize(name)
    @name = name
    @songs = []
  end

  # Class methods



  def self.all
    @@all
  end

  def self.destroy_all
    self.all.clear
  end

  def self.create(name)
    artist = Artist.new(name)
    artist.save
    artist
  end

  #Instance Methods

  def save
    @@all << self
  end

  def add_song(song)
    song.artist = self if !song.artist
    @songs << song unless @songs.include?(song)
  end

  def genres
    @songs.collect {|song| song.genre }.uniq
  end




end
