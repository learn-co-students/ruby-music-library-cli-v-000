
class Artist
  extend Concerns::Findable
  attr_accessor :name, :songs
  attr_writer  :genre
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
end

def self.create(name)
  artist = Artist.new(name)
  artist.save
  artist
end

def add_song(song)
  song.artist ||= self
   @songs << song if @songs.include?(song) == false
    
end

def genres
genre = self.songs.collect do |song|
  song.genre
 
end
genre.uniq
end
end