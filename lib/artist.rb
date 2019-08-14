#require_relative './concerns/artist_and_genre_methods'

class Artist
  extend Concerns::Findable
  # include Concerns::InstanceMethods
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
  @@all.clear
end

def save
  @@all << self
  self
end


def self.create(name)
  name = self.new(name)
  name.save
  name
end

  def add_song(song)
       song.artist = self unless song.artist == self
      @songs << song unless @songs.include?(song)
  end

  def songs
    @songs
  end

def genres
  genres = self.songs.collect do |song|
    song.genre
  end
  genres.uniq
end



end
