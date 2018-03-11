require 'pry'

class Song
@@all = []

  attr_accessor :name
  attr_reader :artist, :genre

  def initialize(name, artist = nil, genre = nil)
    @name = name
    if artist
      artist.add_song(self)
   end
    if genre
      genre.add_song(self)
    end
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
    song = self.all.detect {|song| song.name == name}
    if song == nil
       song = Song.new(name)
       song.save
      end
     return song
  end

  def artist=(artist)
    @artist = artist
    artist.add_song(self)
  end

  def genre=(genre)
    @genre = genre
    genre.add_song(self)
  end

  def self.find_by_name(name)
    self.all.detect {|song| song.name ==name}
  end

  def self.find_or_create_by_name(name)
      self.find_by_name(name)
      self.create(name)
  end

  def self.new_from_filename(filename)
    artist = filename.split(" - ")[0]
    name = filename.split(" - ")[1]
    genre = filename.split(" - ")[2]

    song = Song.find_or_create_by_name(name)
    artist = Artist.create(artist)
    song.artist = artist

    p song.name
    p song.artist.name
  end

  # def self.create_from_file
  #
  # end

end
