class Artist

    attr_accessor :name

    @@all = []
    @songs = []
    @genres = []
def initialize(name)
  @name = name
  @songs = []
  # @genre = genre
 @@all << self
 # artist.song = self
end

def add_song(song)
  @songs << song
  song.artist = self unless song.artist

end


def genres
  self.songs.collect do |song|
     song.genre

  end
end

def songs
  @songs
end

def self.create(name)
  artist = Artist.new(name)
  @@all << artist
  artist
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

end
