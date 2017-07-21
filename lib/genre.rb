class Genre
 extend Concerns::Findable
 
attr_accessor :name, :songs

@@all = []

def initialize(name)
  @name = name
  @songs = []
end

def add_song(song)
  song.genre = self if !song.genre
  @songs << song unless @songs.include?(song)
end

def artists
  songs.collect {|song| song.artist}.uniq
end

def self.all
  @@all
end

def self.destroy_all
  @@all.clear
end

def save
  self.class.all << self
end

def self.create(genre)
  new_genre = self.new(genre)
  new_genre.save
  new_genre
end

end
