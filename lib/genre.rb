class Genre
extend Concerns::Findable

attr_accessor :name

@@all = []

def initialize(name)
  @name = name
  @songs = []
end

def songs
  @songs
end

def add_song(song)
 if @songs.detect {|x| x == song}
  else
  @songs << song
end
if song.genre == self
  else
  song.genre = self
end
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
  genre = Genre.new(name)
  genre.save
  genre
end

def artists

self.songs.collect {|song| song.artist}.uniq

end


end