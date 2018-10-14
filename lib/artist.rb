class Artist
  
  attr_accessor :name, :songs
  
  @@all = []
  
  def initialize(name)
    @name= name
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
  
  def self.create(art_name)
    art_name = Artist.new(art_name)
    art_name.save
    art_name
  end
  
  def add_song(song)
    if song.artist == nil
      song.artist = self
      @songs << song
    end
  end
  
end
