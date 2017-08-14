require_relative '../lib/concerns/findable'

class Genre

attr_accessor :name, :song, :artists
extend Concerns::Findable
@@all = []

def initialize(name)
  @name = name
  @songs = []
end

def songs
  @songs
end

def artists
  artists_array = []
  self.songs.collect do |song|
      artists_array << song.artist
    end
artists_array.uniq
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
  self.new(name).tap {|genre| genre.save}
end


end
