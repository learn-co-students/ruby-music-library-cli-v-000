require 'pry'

class Artist
  extend Concerns::Findable
attr_accessor :name, :songs, :genre

@@all=[]

def initialize(name)
  @name=name
  @songs=[]
end


def save
  @@all<<self
end

def self.all
  @@all
end


def add_song(song)
  if @songs.include?(song)
  else
  @songs<<song
  song.artist=self
end
end

def self.destroy_all
  self.all.clear
end

def self.create(name)
  artist = self.new(name)
artist.save
artist
end

def genres
@songs.collect {|song| song.genre}.uniq
end




end