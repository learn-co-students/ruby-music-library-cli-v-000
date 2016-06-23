class Song

  attr_accessor :name, :artist, :genre
  extend Concerns::Findable

  @@all = []

  # class methods
  def initialize(name, artist = nil, genre = nil)
    @name = name
    self.artist = artist if artist != nil
    self.genre = genre if genre != nil
  end

  def self.all
    @@all
  end

  def self.destroy_all
    self.all.clear
  end

  def self.create(name)
    song = self.new(name)
    song.save
    song
  end

  def self.new_from_filename(filename)
    filename = filename.split(/( - |\.)/)
    song_name = filename[2]
    artist = Artist.find_or_create_by_name(filename[0])
    genre = Genre.find_or_create_by_name(filename[4])
    song = self.new(song_name, artist, genre)
    song
  end
  def self.create_from_filename(filename)
    song = self.new_from_filename(filename)
    self.all << song
    song
  end

  # instance methods
  def save
    self.class.all << self
  end

  def artist=(artist)
    @artist = artist
    @artist.add_song(self)
  end

  def genre=(genre)
    @genre = genre
    @genre.add_song(self)
  end

end
