class Genre
  attr_accessor :name
  extend Concerns::Findable
  extend Concerns::Memorable::ClassMethods
  include Concerns::Memorable::InstanceMethods

  @@all = []

  def initialize(name)
    @name = name
    @songs = []
end

def self.all
  @@all
end

def songs
  @songs
end

def artists
  artists = []
  self.songs.each {|song|artists << song.artist}
  artists.uniq
end

def add_song(song)
  song.genre = self unless song.genre != nil
  self.songs << song unless self.songs.include?(song)
end
end  
