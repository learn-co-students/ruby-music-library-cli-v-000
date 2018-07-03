class Artist 
  extend Concerns::Findable::ClassMethods
 
  attr_accessor :name, :songs, :genres
  
  @@all = []
  
  def self.all
    @@all 
  end
  
  def initialize(name)
    @name = name
    @songs = []
  end
  
  def self.destroy_all
    @@all.clear
  end
  
  def save
    @@all << self
  end
  
  def self.create(name)
    new(name).tap {|artist| artist.save}
  end

  def add_song(song)
    song.artist = self if song.artist.nil?
    self.songs << song unless self.songs.include?(song)
  end

  def genres
    songs.collect{ |s| s.genre }.uniq
  end

end