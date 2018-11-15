class Artist
  attr_accessor :name
  attr_reader :songs

  @@all = []
  
  def initialize(name)
    @name = name
    @songs = []
  end
  
  def self.all
    @@all
  end
  
  def self.destroy_all
    self.all.clear
  end
  
  def save
    @@all << self
  end
  
  def self.create(name)
    artist = self.new(name)
    artist.save
    artist
  end
  
  def add_song(song)
   # unless self.songs.include?(song)
    #  self.songs << song
    if song.artist == 'Unknown' || song.artist.nil?
      song.artist = self
    elsif !self.songs.include?(song)
      self.songs << song
    end
    song
  end
    
end