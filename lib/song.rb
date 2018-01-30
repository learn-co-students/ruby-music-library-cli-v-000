class Song
  extend Concerns::Findable

  attr_accessor :name, :artist, :genre

  @@all = []

  def initialize(name, artist = nil, genre = nil)
    @name = name
    self.artist = artist if artist != nil
    self.genre = genre if genre != nil
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

  def self.create(input_song)
    new_song = self.new(input_song)
    new_song.save
    new_song
  end

  def artist=(artist)
    @artist = artist
    artist.add_song(self)
  end

  def genre=(genre)
    @genre = genre
    genre.add_song(self)
  end

  def self.new_from_filename(fn)
    fn = fn.split(" - ")
    song = self.new(fn[1])
    song.artist = Artist.find_or_create_by_name(fn[0])
    song.genre = Genre.find_or_create_by_name(fn[2].gsub(".mp3", ""))
    song
  end

  def self.create_from_filename(file)
    song = self.new_from_filename(file)
    song.save
    song
  end

end
