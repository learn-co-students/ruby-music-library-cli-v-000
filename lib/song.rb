class Song

  extend Concerns::Findable

  attr_accessor :name, :artist, :genre
  @@all = []

  def initialize(name, artist=nil, genre=nil)
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

  def self.new_from_filename(filename)
    normalized_arr = filename.chomp(".mp3").split(" - ")
    song = self.new(normalized_arr[1])
    artist = Artist.find_or_create_by_name(normalized_arr[0])
    artist.add_song(song)
    genre = Genre.find_or_create_by_name(normalized_arr[2])
    genre.add_song(song)
    song
  end

  def self.create_from_filename(filename)
    song = self.new_from_filename(filename)
    song.save
    song
  end

end
