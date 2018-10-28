class Artist 
  
  attr_accessor :name, :songs, :genres 
  
  @@all = []
  
  def initialize(name)
    @name=name 
    @songs = []
  end 

  
  def save
  @@all << self 
  end 

  def self.all
  @@all
  end 

  def self.destroy_all
  @@all.clear 
  end 

  def self.create(name)
    new_artist = Artist.new(name)
    @@all << new_artist
    new_artist
  end 

    def add_song(song)
    if song.artist == nil 
      song.artist = self 
    else
      nil 
    end 
    if @songs.include?(song)
      nil 
    else 
      @songs << song
    end 
    song 
  end 
  
  def genres                     
    songs.map do |song|
      song.genres
    end 
  end 

end #ends class 
