class Artist
  extend Concerns::Findable
  
  attr_accessor :name
  
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
  
  def self.create(artist)
    artist = Artist.new(artist)
    artist.save
    artist
  end

  def add_song(song)
    if @songs.include?(song) == false
      @songs << song
    end
    if song.artist != self
      song.artist = self
    end
  end

  def songs
    @songs
  end
  
  def genres
    self.songs.map {|song| song.genre}.uniq
  end
end