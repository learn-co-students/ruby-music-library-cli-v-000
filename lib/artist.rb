class Artist 
  attr_accessor :name, :song, :songs
  
  extend Concerns::Findable
  extend AllForAll::ClassMethods
  include AllForAll::InstanceMethods
  
  @@all = []
  
  def initialize(name)
    @name = name
    @songs = []
  end
  
  def self.all 
    @@all
  end
    
  def add_song(song)
    song.artist = self unless song.artist == self
    @songs << song unless @songs.include?(song)
  end
  
  def genre 
    artist.genre = self
  end
  
  def genres
    @songs.collect {|song| song.genre}.uniq
  end

end