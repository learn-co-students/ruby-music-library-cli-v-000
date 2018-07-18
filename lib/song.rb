class Song
  extend Concerns::Findable
  @@all = []

  attr_accessor :name, :artist, :genre

  def initialize(name, artist = nil, genre = nil)
    @name = name
    self.artist = artist if artist
    self.genre = genre if genre
  end

  def self.all
    @@all
  end

  def self.destroy_all
    @@all = []
  end

  def self.create(songTitle)
    song = self.new(songTitle)
    song.save
    song
  end

  def self.new_from_filename(fileName)
    parsedFileName = fileName.split(" - ")

    artist = Artist.find_or_create_by_name(parsedFileName[0])
    genre = Genre.find_or_create_by_name(parsedFileName[2].gsub(".mp3", ""))

    new(parsedFileName[1], artist, genre)
  end

  def self.create_from_filename(fileName)
    newSong = self.new_from_filename(fileName)
    newSong.save
    newSong
  end

  def save
    @@all << self
  end

  def artist=(artist)
    @artist = artist
    artist.add_song(self)
  end

  def genre=(genre)
    @genre = genre
    genre.songs << self unless genre.songs.include?(self)
  end
end
