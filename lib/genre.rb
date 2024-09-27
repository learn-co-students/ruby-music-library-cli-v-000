class Genre
  extend Concerns::Findable
  extend Persistable::ClassMethods
  include Persistable::InstanceMethods
  attr_accessor :name, :song
  
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
    genre = Genre.new(name)
  end
  
  def songs
    @songs
  end
  
  def add_song(song)
    if !@songs.include?(song)
    @songs << song
    end
    if song.genre != self 
      song.genre = self
    end
  end
  
  def artists 
    self.songs.collect {|s| s.artist}.uniq
  end
  
end