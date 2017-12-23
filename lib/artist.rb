
require 'pry'

class Artist
attr_accessor :name

extend Concerns::Findable
include Concerns::Memorable::InstanceMethods
extend Concerns::Memorable::ClassMethods

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

def add_song(song)
  song.artist = self unless song.artist != nil
  self.songs << song unless self.songs.include?(song)
end

def genres
  genres = []
  self.songs.each {|song|genres << song.genre}
  genres.uniq
end

end
