require 'pry'
require_relative './concerns/findable'
class Artist
   @@all = []
   attr_reader :name
   extend Concerns::Findable

   def initialize(name)
      @name = name
      @songs = []
      
   end
   # CLASS METHODS

   def self.all
      @@all
   end

   def self.destroy_all
      @@all.clear
   end
   
   def self.create(name)
      created_artist = self.new(name)
      created_artist.save
      created_artist
   end

   # INSTANCE METHODS

   def save
      @@all << self
   end

   def name=(name)
      @name = name
   end

   def songs
      @songs
   end

   def genres
      self.songs.collect {|song| song.genre }.uniq
   end

   def add_song(song)
      if song.artist == nil 
         song.artist = self
      end
      if self.songs.include?(song)
      else
         @songs << song
      end
   end
end

