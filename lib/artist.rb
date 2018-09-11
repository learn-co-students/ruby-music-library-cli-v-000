class Artist
  attr_accessor :name, :songs, :genre
  
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
    @@all << self
  end
  
  def add_song(song)
    song.artist ||= self
    if !@songs.include?(song)
      @songs << song
    end
  end
  
  def genres
    Song.all.collect { |s| s.genre }.uniq
  end
    
  def self.find(name)
    self.all.find { |a| a.name == name}
  end
  
  def self.create_by_name(name)
    song = self.create
    song.name = name
    song
  end
  
  def self.find_or_create_by_name(name)
    self.find(name) || self.create(name)
  end
  
  def print_songs
    songs.each {|s| puts s.name}
  end
  
end