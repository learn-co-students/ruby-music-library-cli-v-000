require 'pry'
class Song

  attr_accessor :name, :artist, :genre
  extend Concerns::Findable

  @@all = []

  def initialize(name, artist = nil, genre = nil)
    @name = name
    if artist != nil
      self.artist=(artist)
    end
    if genre != nil
      self.genre=(genre)
    end

  end

  def save
    @@all << self
  end

  def self.destroy_all
    @@all.clear
  end

  def self.create(song)
    song = Song.new(song)
    song.save
    song
  end

  def self.all
    @@all
  end

  def artist=(artist)
    @artist = artist
    artist.add_song(self)
  end

  def genre=(genre)
    @genre = genre
    genre.add_song(self)
  end

  # def self.find_by_name(name)
  #   @@all.find {|s| s.name == name}
  # end

  # def self.find_or_create_by_name(song_name)
  #   if self.find_by_name(song_name)
  #     self.find_by_name(song_name)
  #   else
  #     Song.create(song_name)
  #   end
  # end

  def self.new_from_filename(file)
    song = file.split(" - ")[1]
    artist = file.split(" - ")[0]
    genre = file.split(" - ")[2]
    genre = genre.split(".")[0]
    song = self.find_or_create_by_name(song)
    artist = Artist.find_or_create_by_name(artist)
    genre = Genre.find_or_create_by_name(genre)
    artist.add_song(song)
    song.genre = genre
    song
  end

  def self.create_from_filename(file)
    self.new_from_filename(file)
  end

end
