class Song
  extend Concerns::Findable
  
  attr_accessor :name
  attr_reader :songs, :artist, :genre

  def initialize(name, artist="", genre="")
    @name = name
    @songs = []
    @@all = []
    @artist = artist
    artist.songs << self unless artist == ""
    @genre = genre
    genre.songs << self unless genre == ""
  end

  def self.all
    @@all
  end

  def self.destroy_all
    @@all = []
  end

  def save
    @@all << self
  end

  def self.create(name)
    new_song = self.new(name)
    @@all << new_song
    new_song
  end

  def artist=(art)
    @artist = art
    art.add_song(self)
  end

  def genre=(new_genre)
    @genre = new_genre
    new_genre.songs << self unless new_genre.songs.include?(self) == true
  end
end