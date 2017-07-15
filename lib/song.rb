class Song

  attr_accessor :name, :artist, :genre
  @@all = []

  extend Concerns::Findable

  def initialize(name, artist = nil, genre = nil)
    @name = name
    self.artist = artist if artist
    self.genre = genre if genre
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
    song = self.new(name)
    song.save
    song
  end

  def artist=(artist)
    @artist = artist
    artist.add_song(self)
  end

  def genre=(genre)
    @genre = genre
    genre.songs << self unless genre.songs.include?(self)
  end

  def self.new_from_filename(filename)
    array = filename.split(" - ")
    song = self.new(array[1])
    song.artist = Artist.find_or_create_by_name(array[0])
    song.genre = Genre.find_or_create_by_name(array[2].gsub(".mp3", ""))
    song
  end

  def self.create_from_filename(filename)
    song = self.new_from_filename(filename)
    song.save
    song
  end

end
