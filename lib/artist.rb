class Artist
  
  extend Concerns::Findable
  attr_accessor :name, :songs
  @@all = []
  
  def initialize(name)
    @name = name
    @songs = []
    save
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
  
  def self.create(artist_name)
    new_artist = self.new(artist_name)
  end
  
  def add_song(song)
    if song.artist == nil || song.artist != self
      song.artist = self
    end
    
    if !@songs.include?(song)
      @songs << song
    end
  end
  
  def genres
    @songs.collect {|song| song.genre}.uniq
  end
    
end
  