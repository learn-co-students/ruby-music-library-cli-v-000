require 'pry'
require_relative '../config/environment'

class Artist
extend Concerns::Findable
attr_accessor :name
@@all = []

 def initialize(name)
   @name = name
   @songs=[]
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
   new_artist = Artist.new(name)
   new_artist.save
   new_artist
 end

 def songs
   @songs
 end

 def add_song(song)
   if not song.artist
     song.artist = self
   end
   if !@songs.include?(song)
     @songs << song
   end
 end

 def genres
   artist_genres= @songs.collect { |song| song.genre }
   artist_genres.uniq
 end
end
