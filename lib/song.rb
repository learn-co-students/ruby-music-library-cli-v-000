require "pry"

class Song
  attr_accessor :name
  attr_reader :artist, :genre
  @@all = []

  def initialize(name, artist = nil, genre = nil)
    @name = name
    self.artist = artist if artist
    self.genre = genre if genre
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
    self.all.clear
  end

  def save
    @@all << self
  end

  def self.create(name)
    self.new(name).tap {|song| song.save}
  end

  def self.find_by_name(name)
    self.all.detect {|song| song.name == name}
  end

  def self.find_or_create_by_name(name)
    self.find_by_name(name) ? self.find_by_name(name) : self.create(name)
  end

  #can also do
    #def self.find_or_create_by_name(name)
      #self.find_by_name(name) || self.create(name)
    #end

    def self.new_from_filename(filename)
      artist, song, genre = filename[0...-4].split(" - ")   #.split(" - ")
      new_song = self.new(song)
      new_song.artist = Artist.find_or_create_by_name(artist)
      new_song.genre = Genre.find_or_create_by_name(genre)
      new_song.save
      new_song
    end

    def self.create_from_filename(filename)
      Song.new_from_filename(filename)
    end
  end
