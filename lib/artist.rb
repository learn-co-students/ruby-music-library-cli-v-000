class Artist
  extend Concerns::Findable
  attr_accessor :name
  attr_reader :songs
  @@all = []

  def initialize(name)
    @name = name
    @songs = []
  end

  def genres
    self.songs.map{|song| song.genre}.uniq
  end

  def save
    @@all << self
  end

  def self.find_by_name(name)
    self.all.detect{ |artist| artist.name ==name }
  end

  def add_song(song)
    @songs << song unless @songs.include?(song)
    song.artist = self unless song.artist == self
  end

  def self.create(name)
    artist = self.new(name)
    artist.save
    artist
    # new(name).tap{|x| x.save} returns the tapped object
  end

  def self.all
    @@all
  end

  def self.destroy_all
    @@all.clear
  end
end
