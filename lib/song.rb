require 'pry'

class Song
  extend Concerns::Findable

  attr_accessor :name, :artist, :genre

  @@all = []

  def initialize(name, artist=nil, genre=nil)
    @name = name
    self.artist = artist if artist != nil
    self.genre = genre if genre != nil
  end

  def genre=(genre)
    @genre = genre
    genre.add_song(self)
  end

  def artist=(artist)
    @artist = artist
    artist.add_song(self)
  end

  def self.all
    @@all
  end

  def save
    @@all << self
  end

  def self.destroy_all
    @@all.clear
  end

  def self.create(name)
     x = self.new(name)
     x.save
     x
  end

  #def self.find_by_name(name)
  #  @@all.each do |song|
  #    if song.name == name
  #      return song
  #    end
  #  end
  #  return nil
  #end

  def self.new_from_filename(filename)
    info = filename.split(" - ")
    genre_info = info[2].split(".")
    name = info[1]
    artist_name = info[0]
    genre_name = genre_info[0]

    artist = Artist.find_or_create_by_name(artist_name)
    genre = Genre.find_or_create_by_name(genre_name)

    new(name, artist, genre)

  end

  def self.create_from_filename(filename)
    @@all << new_from_filename(filename)
  end

end
