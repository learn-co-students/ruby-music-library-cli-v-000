
class Artist
  extend Concerns::Findable


  attr_accessor :name

  @@all = []

  def initialize(name)
    @name = name
    @songs = []
  end
  #CLASS METHODS
  def self.all
    @@all
  end

  def self.destroy_all
    self.all.clear
  end

  def self.create(name)
    instance  = self.new(name)
    instance.save
    instance
  end

  #INSTANCE METHODS
  def save
    self.class.all << self
  end

  def songs
    @songs
  end

  def add_song(song)
    @songs << song unless @songs.include?(song)
    song.artist = self unless song.artist == self
    #  if !(self.songs.include?(song))
    #   song.artist = self if song.artist == nil
    #   self.songs << song
    #  end

  end

  def genres
   self.songs.collect do |song|
     song.genre
   end.uniq
  end

end
