require 'pry'
class Artist
attr_accessor :name, :songs
    @@all = []

    extend Concerns::Findable

  def initialize(name)
    @name = name
    @@all << self
      @songs = []
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
Artist.new(name)
end


def add_song(song)
  song.artist = self unless song.artist == self
  #@songs << song
   @songs << song unless @songs.include?(song)
end
#binding.pry
end
