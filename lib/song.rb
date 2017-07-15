class Song
  extend Concerns::Findable

  attr_accessor :name
  attr_reader :artist, :genre
  @@all = []

  ### INSTANTIATION METHODS ###
  def initialize(name, artist = nil, genre = nil)
    @name = name
    self.artist = artist if artist
    self.genre = genre if genre
  end

  def self.create(name, artist = nil, genre = nil)
    song = Song.new(name, artist = nil, genre = nil)
    song.save
    song
  end

  def self.new_from_filename(filename)
    file_data = filename.split(" - ")
    artist = Artist.find_or_create_by_name(file_data[0])
    name = file_data[1]
    file_data[2].slice! ".mp3"
    genre = Genre.find_or_create_by_name(file_data[2])

    Song.new(name, artist, genre)
  end

  def self.create_from_filename(filename)
    song = Song.new_from_filename(filename)
    song.save
    song
  end

  ### CUSTOM SETTER METHODS ###
  def artist=(artist)
    @artist = artist
    artist.add_song(self)
  end

  def genre=(genre)
    @genre = genre
    genre.add_song(self)
  end

  ### CLASS METHODS ###
  def self.all
    @@all
  end

  def self.destroy_all
    self.all.clear
  end

  ### INSTANCE METHODS ###
  def save
    self.class.all << self
  end

end
