require 'pry'
class Artist
attr_accessor :name, :songs
extend Concerns::Findable

@@all = []
def initialize(name)
@name = name
@songs = []

end

def add_song(song)
  song.artist ||= self
  @songs << song unless @songs.include?(song)

  end

def self.all
@@all
end

def self.destroy_all
self.all.clear
end

def save
self.class.all << self
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
