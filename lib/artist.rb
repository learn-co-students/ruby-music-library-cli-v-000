class Artist

  attr_accessor :name, :songs

  @@all= []

  extend Concerns::Findable

  def initialize(name)
    @name= name
    @songs= []
  end

  def add_song(song)
    @songs << song unless @songs.include?(song)
    song.artist= self unless song.artist== self
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
    artist= Artist.new(name)
    artist.save
    artist
  end

  def genres
    self.songs.collect  do |song|
    song.genre
  end.uniq
end

def to_s
  self.name
end
end
