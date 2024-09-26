class Song
  extend Concerns::Findable
  attr_accessor :name, :artist, :genre

  @@all = []

  def initialize(name, artist = nil, genre = nil)
    @name = name
    self.artist = artist if artist
    self.genre = genre if genre
  end

  def artist=(artist)
    @artist = artist
    artist.add_song(self)
  end

  def genre=(genre)
    @genre = genre
    genre.add_song(self)
  end

  def self.all
    @@all
  end

  def self.destroy_all
    self.all.clear
  end

  def save
    @@all << self
  end

  def self.create(song)
    new_song = Song.new(song)
    new_song.save
    new_song
  end

  def self.new_from_filename(filename)
    filename_array = filename.split(' - ')
    song = self.new(filename_array[1])
    song.artist = Artist.find_or_create_by_name(filename_array[0])
    song.genre = Genre.find_or_create_by_name(filename_array[2].gsub(".mp3", ""))
    song
  end

  def self.create_from_filename(filename)
    new_song = self.new_from_filename(filename)
    new_song.save
    new_song
  end

end
