class Artist
attr_accessor :name, :songs
@@all = []
extend Concerns::Findable

def initialize (name)
  @name = name
  @songs = []
end

def add_song (song)
  @songs << song if !@songs.include?(song)
  song.artist=(self) if song.artist==nil
  @songs
end

def genres
  self.songs.collect {|song| song.genre}.uniq
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
  artist = Artist.new(name)
  artist.save
  artist
end


end
