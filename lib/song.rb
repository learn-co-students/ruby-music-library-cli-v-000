require 'pry'
class Song

  extend Concerns::Findable
  attr_writer :name
  attr_reader :name, :artist, :genre

  @@all = []

  def initialize(name, artist = nil, genre = nil)
    @name = name
    @artist = artist
    @genre = genre
    @@all << self
    if @artist != nil
      self.artist=(artist)
    end
    if @genre != nil
      self.genre=(genre)
    end
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
    song = new(name)
  end

  def self.new_from_filename(filename)
    file_array = filename.split(".mp3").delete_at(0).split(" - ")
      song = self.new(file_array[1])
      song.artist = Artist.find_or_create_by_name(file_array[0])
      song.genre = Genre.find_or_create_by_name(file_array[2])
      song
  end

  def self.create_from_filename(filename)
    file_array = filename.split(".").delete_at(0).split(" - ")
      song = self.new(file_array[1])
      song.artist = Artist.find_or_create_by_name(file_array[0])
      song.genre = Genre.find_or_create_by_name(file_array[2])
      song
  end
#binding.pry
end