class Song

  extend Concerns::Findable

  attr_accessor :name, :artist, :genre, :filename

  @@all = []

  def initialize(name, artist = nil, genre = nil)
    @name = name
    self.artist = artist if artist
    self.genre = genre if genre
  end

  def artist=(artist)
    @artist = artist
    Artist.new(artist)
    @artist.add_song(self)
  end

  def genre=(genre)
    genre.songs << self if !genre.songs.include?(self)
    @genre = genre
  end

  def save
    @@all << self
  end

  def self.create(name)
    song = Song.new(name)
    song.save
    song
  end

  def self.all
    @@all
  end

  def self.new_from_filename(filename)
    @filename = filename
    file = File.basename(@filename, ".mp3").split(" - ")
    song = Song.find_or_create_by_name(file[1])
    song.artist = Artist.find_or_create_by_name(file[0])
    song.genre = Genre.find_or_create_by_name(file[2])
    song
  end

  def self.create_from_filename(filename)
    @filename = filename
    song = Song.new_from_filename(@filename)
    song
  end

  def self.destroy_all
    self.all.clear
  end

end
