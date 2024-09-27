require 'pry'

class Song
  attr_accessor :name
  attr_reader :artist, :genre
  extend Concerns::Findable

  @@all = []

  def initialize(name, artist=nil, genre=nil)
    @name = name
    self.artist = artist if artist
    self.genre = genre if genre
  end

  def artist=(artist)
    if artist != nil
      @artist = artist
      artist.add_song(self)
    end
  end

  def genre=(genre)
    if genre != nil
      @genre = genre
      genre.add_song(self)
    end
  end

  def save
    @@all << self
  end

  def self.destroy_all
    @@all = []
  end

  def self.create(name)
    song = Song.new(name)
    self.all << song
    song
  end

  def self.all
    @@all
  end

  def self.new_from_filename(file_name)
    song = self.new(file_name.split(" - ")[1])
    song.artist = Artist.find_or_create_by_name(file_name.split(" - ")[0])
    song.artist.songs << song
    song.genre = Genre.find_or_create_by_name(file_name.split(" - ")[2].chomp('.mp3'))
    song
  end

  def self.create_from_filename(file_name)
    song = self.new(file_name.split(" - ")[1])
    song.artist = Artist.find_or_create_by_name(file_name.split(" - ")[0])
    song.genre = Genre.find_or_create_by_name(file_name.split(" - ")[2].chomp('.mp3'))
    song.save
    song
  end
end
