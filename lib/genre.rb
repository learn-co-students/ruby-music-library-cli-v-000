class Genre
  extend Concerns::Findable
  attr_accessor :name, :genre
  attr_reader :songs
  @@all = []

  def initialize(name)
    @name = name
    @songs = []
  end

  def save
    @@all << self
  end

  def self.create(name)
    genre = self.new(name)
    genre.save
    genre
  end

  def add_song(song)
    song.genre = self unless song.genre
    songs << song unless songs.include?(song)
end

def artist=(artist)
  @artist = artist
  if artist
    artist.add_song(self)
end
end

  def artists
    songs.collect {|song| song.artist}.uniq
  end

  def songs
    @songs
  end

  def self.all
    @@all
  end

  def self.destroy_all
    self.all.clear
  end

end
