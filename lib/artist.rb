
class Artist
  attr_accessor :name
  attr_reader :songs
  
  extend Concerns::Findable

  @@all = [] 
  def initialize(name)
    @name = name
    @songs = []
    @@all << self

  end
  
  def self.all
    @@all
  end

  def self.create(name)
    self.new(name).tap {|a| a.save}
  end
    
  def self.destroy_all
    @@all = []
  end
  
  def save
    self.class.all << self
  end
  
  def add_song(song)
    song.artist ||= self
    if !@songs.include?(song)
      @songs << song
    end
  end
  
  def genres
    @songs.collect { |s| s.genre }.uniq
  end
    
  def self.find(name)
    self.all.find { |a| a.name == name}
  end

end