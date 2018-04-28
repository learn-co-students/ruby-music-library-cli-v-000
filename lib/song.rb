class Song
  attr_accessor :name
  attr_reader :artist, :genre
  @@all = []

  extend Concerns::Findable

  def artist=(artist)
    @artist = artist
    artist.add_song(self)
  end

  def genre=(genre)
    @genre = genre
    genre.add_song(self)
  end

  def initialize(name, artist =nil, genre =nil)
    @name = name
    self.artist = artist if artist
    self.genre = genre if genre
  end

  def self.all
    @@all
  end

  def self.destroy_all
    all.clear
  end

  def save
    self.class.all << self
  end

  def self.create(name, artist =nil, genre =nil)
    new_song = new(name, artist, genre)
    new_song.save
    new_song
  end

  def self.arrayify(fname)
    name_array = fname.split(" - ")
    name_array.last.slice!(".mp3")
    name_array
  end

  def self.new_from_filename(fname)
    name_array = arrayify(fname)
    name = name_array[1]
    artist = Artist.find_or_create_by_name(name_array[0])
    genre = Genre.find_or_create_by_name(name_array[2])
    new_song = self.new(name, artist, genre)
  end

  def self.create_from_filename(fname)
    new_song = new_from_filename(fname)
    new_song.save
    new_song
  end

end
