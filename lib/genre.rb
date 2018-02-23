class Genre
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
    song.genre = self unless song.genre == self
  end

  def artists
    self.songs.collect{|song| song.artist}.uniq
  end

end 
