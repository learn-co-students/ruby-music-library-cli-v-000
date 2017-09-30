class Artist
  extend Concerns::Findable #Take all of the methods in the findable module and add them as class methods
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

  def add_song(song)
    song.artist = self unless song.artist == self
    @songs << song unless @songs.include?(song)
  end

  def genres
    self.songs.map{|song| song.genre}.uniq
  end

def self.destroy_all
  @@all = []
end

def save
  @@all << self
end

def self.destroy_all
  @@all = []
end

def self.create(name)
  artist = Artist.new(name)
  artist.save
  artist
end

end
