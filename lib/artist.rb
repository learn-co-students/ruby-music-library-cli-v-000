class Artist
  extend Concerns::Findable
  extend Persistable::ClassMethods
  include Persistable::InstanceMethods

  attr_accessor :name, :songs

  @@all = []


  def self.all
    @@all
  end

  def initialize(name)
   @name = name
   @songs = []
  end

  def songs
    @songs
  end

  def add_song(song)
    self.songs << song unless self.songs.include?(song)
    song.artist = self unless song.artist == self
  end

  def genres
    self.songs.collect{|song| song.genre}.uniq
  end

end 
