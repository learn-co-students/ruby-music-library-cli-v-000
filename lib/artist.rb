class Artist 
  extend Concerns::Findable
  attr_accessor :name, :songs 
  @@all=[]
  def initialize(name)
    @songs=[]
    @name=name
  end 
  def genres
    g=[]
    @songs.each{|s| g << s.genre if g.include?(s.genre)==FALSE}
    g
  end
  def self.all 
    @@all 
  end 
  def self.destroy_all
    Artist.all.clear
  end 
  def save 
    Artist.all << self 
  end 
  def self.create(name)
    x=Artist.new(name)
    x.save 
    x
  end
  def add_song(song)
    if song.artist==self and self.songs.include?(song)==FALSE
      @songs << song 
    end 
    if song.artist==nil
      @songs << song
      song.artist=self
    end
  end 
    
end
   