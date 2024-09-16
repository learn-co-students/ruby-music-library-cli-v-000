class Artist
@@all = []
attr_accessor :name, :songs
extend Concerns::Findable


def initialize(name)
  @name = name
  @@all << self
  @songs = []
end

def self.all
  @@all
end

def save
  @@all << self
end

def self.destroy_all
  @@all.clear
end

def self.create(song)
  self.new(song)
end

def add_song(song)
  @songs << song unless @songs.include?(song)
  song.artist = self unless song.artist != nil
end

def genres
  self.songs.collect{|song| song.genre}.uniq
end


end
