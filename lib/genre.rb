require 'pry'

class Genre
  extend Basics::ClassMethods, Concerns::Findable
 include Basics::InstanceMethods
 @@all = []
 attr_accessor :name, :songs

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
   song.genre = self unless song.genre == self
   self.songs << song unless self.songs.include?(song)
 end

def artists
  unique_artists = []
  unique_artists << self.songs.collect {|song| song.artist}
  unique_artists.flatten.uniq
end

end
