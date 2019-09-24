class Artist  
  extend Concerns::Findable
  attr_accessor :name, :song, :genre
  
  @@all = []
  
  def initialize(name)
    @name = name
    @songs = []
  end
  
  def self.destroy_all
    @@all.clear
  end

  def save
    @@all << self
  end
  
  def self.all
    @@all
  end
  
  def self.create(artist)
    new_artist = Artist.new(artist)
    new_artist.save
    new_artist
  end
  
  def add_song(song)
    @songs << song unless songs.include?(song)
    song.artist = self if song.artist == nil
  end
  
  def songs
    @songs
  end
  
  def genres
    self.songs.collect { |song| song.genre }.uniq
  end
end