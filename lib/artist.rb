require 'pry'

class Artist
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
   song.artist = self unless song.artist == self
   self.songs << song unless self.songs.include?(song)
 end

 def genres
   unique_genres = []
   unique_genres << self.songs.collect {|song| song.genre}
   unique_genres.flatten.uniq
 end

end
