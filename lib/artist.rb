class Artist
  attr_accessor :name, :songs, :genre
  
  @@all = []
  
  def initialize(name)
    @name = name
    @songs = []
    save
  end
  
  def self.all
    @@all
  end
  
  def save
    @@all << self
  end
  
  def self.destroy_all
    @@all.clear
  end
  
  def self.create(name)
    new(name).tap{|a| a.save}
  end
  
  def add_song(song)
    song.artist = self unless song.artist == self  
    @songs << song unless @songs.include?(song) 
  end
  
  def genres
    self.songs.collect do |song|
      song.genre
    end.uniq
  end
  
end