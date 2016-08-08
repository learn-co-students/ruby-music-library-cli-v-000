require 'pry'

class Song
extend Concerns::Findable
attr_accessor :name, :artist, :genre, :file_name
@@all = []

  def initialize(name, artist = nil, genre = nil)
    @name = name
    artist.add_song(self) if artist != nil
    genre.add_song(self) if genre != nil
  end

  def self.all
    @@all.sort_by { |song| song.artist.name }
  end

  def self.destroy_all
    @@all.clear
  end

  def save
    @@all << self
  end

  def self.create(name)
    song = Song.new(name)
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

  def self.new_from_filename(file_name)
    file_name = file_name.split(" - ")
    artist = Artist.find_or_create_by_name(file_name[0])
    genre = Genre.find_or_create_by_name(file_name[2].split(".")[0])
    Song.new(file_name[1], artist, genre)
  end

  def self.create_from_filename(file_name)
    file_name = file_name.split(" - ")
    Song.create(file_name[1]).tap do |song|
      song.artist = Artist.find_or_create_by_name(file_name[0])
      song.genre = Genre.find_or_create_by_name(file_name[2].split(".")[0])
    end

  end
end
