class Artist
  extend Concerns::Findable
attr_accessor :name, :songs
attr_reader :genres
@@all = []

def initialize(name)
  @name = name 
  @songs = []
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


def self.find_by_name(name)
  self.all.find {|artist| artist.name == name}
end# of self.find_by_name


def self.find_or_create_by_name(name)
  if self.find_by_name(name) == nil
      self.create(name)
  else 
    self.find_by_name(name) 
  end# of if 
end# of self.find_or_create_by_name

def add_song(song)
  song.artist ||= self  
  @songs << song unless @songs.include?(song)
end# of add_song


end# of Artist