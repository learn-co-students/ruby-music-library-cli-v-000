class Artist 
  extend Concerns::Findable
  attr_accessor :name, :songs
  
    @@all = []
    
  def self.all
    @@all
  end
  
  def self.destroy_all
    self.all.clear
  end

  def initialize(name)
    @name = name
    @songs = []
  end


  def self.create(name)
    # self.new.tap {|o| o.name = name}
    artist = new(name)
    artist.save
    artist
  end
  
  def save
    self.class.all << self
  end
  
  
  def add_song(song)
    songs << song  unless @songs.include?(song)
    song.artist = self unless song.artist
  end
  
  def genres 
    @songs.collect {|song| song.genre}.uniq
  end
  
end