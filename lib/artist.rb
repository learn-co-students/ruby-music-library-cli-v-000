class Artist
  extend Concerns::Findable
  extend Persistable::ClassMethods
  include Persistable::InstanceMethods
  attr_accessor :name, :song, :genre
  
  @@all = []
  
  def initialize(name)
    @name = name
    save
    @songs = []
  end
  
  def self.all
    @@all
  end
  
  def self.create(name)
    artist = Artist.new(name)
  end
  
  def songs
    @songs
  end
  
  def add_song(song)
    if !@songs.include?(song)
    @songs << song
    end
    if song.artist != self 
      song.artist = self
    end
  end
  
  def genres
    self.songs.collect {|s| s.genre}.uniq
  end
  
end