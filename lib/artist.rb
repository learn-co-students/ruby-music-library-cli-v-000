require_relative './concerns/findable.rb'

class Artist
  extend Concerns::Findable

  attr_accessor :name

  @@all = []

  def initialize(name)
    @name = name
    @songs = []
  end

def self.all
  @@all
end

def self.destroy_all
  all.clear
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

def genres
  genre_collection = []
  self.songs.collect do |song|
    genre_collection << song.genre
  end
  genre_collection.uniq
end


def add_song(song)
  if song.artist == nil
       song.artist = self
      end

if !@songs.include?(song)
       @songs << song
     end
  end




end
