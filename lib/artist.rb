class Artist
  extend Concerns::Findable
  
  attr_accessor :name, :songs, :genre
  @@all = []
  
  def initialize(name)
    @name = name
    @songs = []
    self.save
  end
  
  def self.all
    @@all
  end

  def self.create(name)
    artist = Artist.new(name)
  end
  
  def self.destroy_all
    all.clear
  end
  
  def save
    @@all << self
  end
  
  def add_song(song)
    song.artist = self if song.artist == nil
    @songs << song if !@songs.include?(song)
  end
  
  def genres
    genres = []
    @songs.each do |song|
      genres << song.genre
    end
    genres.uniq
  end
  
end