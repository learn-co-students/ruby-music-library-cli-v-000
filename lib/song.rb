class Song
  attr_accessor :name, :artist, :genre
  @@all = []

  def self.all
    @@all
  end

  def initialize(name, artist = nil, genre = nil)
    @name = name
    self.artist = artist if artist
    self.genre = genre if genre
  end

  def self.destroy_all
    @@all.clear
  end

  def save
    @@all << self
  end

  def self.create(created_song)
    song = self.new(created_song)
    song.save
    song
  end

  def artist=(artist)
    @artist = artist
    artist.add_song(self)
  end

  def genre=(genre)
    @genre = genre
    genre.add_song(self)
  end

  def self.find_by_name(name)
    @@all.detect {|x| x.name == name}
  end

  def self.find_or_create_by_name(name)
    self.find_by_name(name) || self.create(name)
  end

  def self.new_from_filename(filename)
    data = filename.split(".mp3")[0].split(" - ")
    song = self.new(data[1])
    song.artist = Artist.find_or_create_by_name(data[0])
    song.genre = Genre.find_or_create_by_name(data[2])
    song
  end

  def self.create_from_filename(filename)
    song = Song.new_from_filename(filename)
    song.save
    song
  end
end
