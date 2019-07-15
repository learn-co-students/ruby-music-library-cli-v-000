class Song 
  attr_accessor :name, :artist, :genre

  @@all = []
  
  def initialize(name, artist=nil)
    @name = name
    self.artist = artist if artist
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
  
  def self.create(name)
    self.new(name).tap do |song|
      song.save
    end
  end 
  
  def artist=(artist)
    if @artist == nil
      @artist = artist
    else
      @artist = @artist
    end 
    if self.artist != nil
      @artist.add_song(self)
    end
    @artist
  end
  
end 