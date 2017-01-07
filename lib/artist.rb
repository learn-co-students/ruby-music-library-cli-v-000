class Artist 
  attr_accessor :name , :songs 
  
  @@all = []

  def initialize(name, artist = nil)
    @name = name
    @songs = []
    @artist = artist
  end 

  def self.all
    @@all
  end
  def self.destroy_all 
    @@all.clear
  end 

  def save
    self.class.all << self 
    
  end

  def self.create(name)
    artist = Artist.new(name)
    self.all << artist
    artist
    
  end 

  def add_song_by_name(name)
      song = Song.new(name)
      @songs << song
      song.artist = self
  end
  

  def add_song(song)
    @songs << song unless @songs.include?(song)
    song.artist = self unless song.artist == self
  end

end 