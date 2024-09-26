class Artist
extend Concerns::Findable
attr_accessor :name, :songs
attr_reader :genres

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
  if @songs.include?(song)
     @songs
  else
    @songs << song
    song.artist = self
  end  
end

def genres
  self.songs.collect {|song| song.genre}.uniq
end

end