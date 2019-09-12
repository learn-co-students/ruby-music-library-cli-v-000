require 'pry'
class Song
  extend Concerns::Findable
  attr_accessor :name
  attr_reader :genre, :artist
  @@all = []

  def initialize(name, artist = nil, genre = nil)
    @name = name
    if artist
      self.artist=(artist)
    end
    if genre
      self.genre=(genre)
    end
  end

  def save
    @@all << self
    self
  end

  def self.all
    @@all
  end

  def self.destroy_all
    all.clear
  end

  def self.create(name)
    new_song = Song.new(name)
    new_song.save
  end

  def artist=(artist)
    @artist = artist
    artist.add_song(self)
  end

  def genre=(genre)
    @genre = genre
    genre.add_song(self)
  end

  def self.new_from_filename(file)
    file_array = file.split(/ - |.mp3/ )
    song = file_array[1]
    artist = file_array[0]
    genre = file_array[2]
    new_song = self.new(song)
    new_song.artist = Artist.find_or_create_by_name(artist)
    new_song.genre = Genre.find_or_create_by_name(genre)
    new_song
  end

  def self.create_from_filename(file)
    new_from_filename(file).save
  end

end
