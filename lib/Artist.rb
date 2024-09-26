require 'pry'
require_relative '../lib/concerns/findable'


class Artist

attr_accessor :name, :songs, :genres
extend Concerns::Findable


@@all =[]

def initialize(name)
  @name = name
  @songs = []
end

def genres
 genres_array = []
self.songs.collect do |song| #iterating over the array of songs
   genres_array << song.genre #returns the collection of genres using genre method in the array of songs
   end
genres_array.uniq


end


def add_song(song)
   song.artist = self unless song.artist != nil
   @songs << song unless @songs.include?(song)
end

def self.all
  @@all
end

def self.destroy_all
  @@all.clear
end

def save
  @@all << self
end

def self.create(name)
  self.new(name).tap{ |artist| artist.save}
end


end
