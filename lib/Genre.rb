class Genre

attr_accessor :name, :songs
@@all = []

extend Concerns::Findable

def initialize(name)
@name = name
@songs = []
end

def artists
  self.songs.collect do |song|
    song.artist
  end.uniq
end

def save
@@all << self
end

def add_song(song)
  if !song.genre
    song.genre = self
  end
  if !@songs.include?(song)
    @songs << song
  end
end

def self.all
@@all
end

def self.destroy_all
  @@all = []
end

def self.create(name)
  x = Genre.new(name)
  x.save
  x
end

end
