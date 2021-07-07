class Artist
  extend Concerns::Findable
attr_accessor :name, :artist, :genre, :songs

@@all = []

def initialize(name)
  @name = name
  @songs = []
end

def self.all
  @@all
end


  def add_song(song)
    if !@songs.include?(song)
   @songs << song
 end
if song.artist == nil
  song.artist = self
end
end

def artist
  add_song(song).artist = self
end

  def songs
    @songs
  end

def save
  @@all << self
end

def self.create(name)
artist = self.new(name)
artist.name = name
artist.save
artist
end

def self.destroy_all
  @@all.clear
end

def genres
  @songs.collect{|s| s.genre}.uniq
end

end
