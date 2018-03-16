class Genre
  extend Concerns::Findable

  attr_accessor :name, :artist
  attr_reader :songs

  # @songs = []
  @@all = []

def initialize(name)
@name = name
@@all << self
@songs = []
end

def artists
  songs.map(&:artist).uniq
end

def add_song(song)
    @songs << song unless song.genre
    @songs << song
  end

def songs
  @songs
end

def self.create(name)
  genre = new(name)
  @@all << genre
  genre
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
