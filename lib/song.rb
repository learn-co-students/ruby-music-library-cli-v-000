require 'pry'
class Song
  extend Concerns::Findable
  @@all = []

  attr_accessor :name, :artist, :genre

  def initialize(name, artist = nil, genre = nil)
    @name = name
    self.artist=(artist) if artist
    self.genre=(genre) if genre
  end

  def artist=(artist_name)
    if artist_name.class == Artist
      @artist = artist_name
      artist_name.add_song(self) if !artist_name.songs.include?(self)
    else
      @artist = Artist.find_or_create_by_name(artist_name)
    end
  end

  def genre=(genre_name)
    if genre_name.class == Genre
      @genre = genre_name
      genre_name.songs << self if !genre_name.songs.include?(self)
    else
      @genre = Genre.find_or_create_by_name(genre_name)
    end
  end

  def self.new_from_filename(file_name)
    #binding.pry
    if file_name.class == String
      file_array = file_name.split(" - ")
      #binding.pry
      new_song = self.find_or_create_by_name(file_array[1])
      new_song.artist = file_array[0]
      new_song.genre = file_array[2].slice(0,file_array[2].length - 4)
      new_song
    end
  end

  def self.create_from_filename(file_name)
    if file_name.class == String
      new_song = self.new_from_filename(file_name)
      new_song.save
      new_song
    end
  end

  def self.create(name)
    new_song = self.new(name)
    new_song.save
    new_song
  end

  def save
    self.class.all << self
  end

  def self.all
    @@all
  end

  def self.destroy_all
    self.all.clear
  end

end
