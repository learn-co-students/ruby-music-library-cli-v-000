class Genre
  extend Concerns::Findable

@@all = []

attr_accessor :name, :song

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
  # create - saved instance
  genre = self.new(name)

  genre.save
  genre

end
def songs
  @songs
end
def add_song(song)
  if songs.include?(song)

else  @songs << song

  if !song.genre

    song.genre = self
end
end
end

def artists


      self.songs.collect do |song|
        song.artist
      end.uniq


end
end
