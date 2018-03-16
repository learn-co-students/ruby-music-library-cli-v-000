class Artist

extend Concerns::Findable

    attr_accessor :name

    @@all = []
    @songs = []

def initialize(name)
  @name = name
  @songs = []
  # @genre = genre
 @@all << self
 # artist.song = self
end

def add_song(song)
  song.artist = self unless song.artist
  @songs << song unless songs.include?(song)
end


def genres
  # songs.map(&:genre).uniq
  songs.map{|song| song.genre}.uniq

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
