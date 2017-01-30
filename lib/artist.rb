class Artist
  extend Concerns::Findable
attr_accessor :name, :songs
attr_reader :genres
@@all = []

def initialize(name)
  @name = name 
  @songs = []
  save 
end# of initialize


def self.all
  @@all
end# of self.all


def genres
  @songs.collect {|song| song.genre}.uniq
end# of genres


def self.destroy_all
  self.all.clear 
end# of self.destroy_all


def save
  @@all << self
end# of save 


def self.create(name)
   artist = self.new(name)
   artist.save
   artist   
end# of self.create


def add_song(song)
  song.artist ||= self  
  @songs << song unless @songs.include?(song)
end# of add_song


end# of Artist