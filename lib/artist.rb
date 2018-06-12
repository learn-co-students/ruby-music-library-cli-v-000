class Artist
  attr_accessor :name, :genre
  extend Concerns::Findable

  @@all = []

  def initialize(name)
    @name = name
    @songs = []
end

  def add_song(song)
    @songs << song unless @songs.include?(song)
    song.artist = self unless song.artist
  end

  def songs
    @songs
  end

  def genres
    songs.collect{ |s| s.genre }.uniq
  end

def self.all
  @@all
end

def save
  @@all << self
end

def self.create(name)
  new(name).tap { |artist| artist.save }
end

def self.destroy_all
  @@all.clear
end

end
