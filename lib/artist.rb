class Artist
  extend Concerns::Findable
  attr_accessor :name, :songs, :genres
  
  @@all = []
  
  def self.all
    @@all
  end
  
  def initialize(name)
    @name = name
    @songs = []
    @genres = []
    save
  end
  
  def save
    @@all << self
  end
  
  def self.destroy_all
    @@all.clear
  end
  
  def self.create(name)
    song = Song.new(name)
    song.save
    song
  end
  
  def genres
    
  end
  
  def add_song(song)
    if !@songs.include?(song)
      @songs << song
    end
    if song.artist.nil?
      song.artist = self
    end
  end
  
end