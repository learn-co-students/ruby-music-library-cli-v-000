class Genre
extend Concerns::Findable


attr_accessor :name, :songs

@@all = []

def initialize(name)
  @name = name
  @songs = []
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

def self.create(name)
  new_genre = Genre.new(name)
  new_genre.save
  new_genre
end

def add_song(song)
  song.genre = self unless song.genre == self
  @songs << song unless self.songs.include?(song)
end

def artists
    artists = []
    @songs.collect do |song|
      artists << song.artist
    end
    artists.uniq
  end
end
