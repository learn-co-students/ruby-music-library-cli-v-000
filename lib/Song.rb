class Song
  attr_accessor  :name,:song, :artist

  @@all = []

  def initialize(name, artist=artist)
   @name = name
   @artist = artist
  end

def self.all
  @@all
end

def save
  @@all << self
end

def self.create(name)
  song = self.new(name)
  song.save
  song
end

def self.destroy_all
  @@all.clear
end

def artist=(artist)
    @artist = artist
  end

def artist
  Song.artist = self
end





end


# rspec spec/004_songs_and_artists_spec.rb
