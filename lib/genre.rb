class Genre

  attr_accessor :name, :artist

  @songs = []
  @@all = []

def initialize(name)
@name = name
@@all << self
@songs = []
end

def add_song(song)
    @songs << song unless song.genre
  end

def songs
  @songs
end

def artists
    @songs.collect do |song|
    song.artist.uniq
    end
    @songs
  end

def self.create(name)
  genre = Genre.new(name)
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
