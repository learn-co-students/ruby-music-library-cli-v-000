require_relative './concerns/findable.rb'

class Song

  attr_accessor :name, :artist, :genre

  @@all = []

  def initialize(name, artist = nil, genre = nil)
    @name = name
    if artist
      self.artist = artist
    end
    if genre
      self.genre = genre
    end
  end

  def self.all
    @@all
  end

  def self.destroy_all
    @@all = []
  end

  def self.create(name)
    new_item = self.new(name)
    new_item.save
    new_item
  end

  def save
    self.class.all << self
  end

  def artist=(artist)
    artist.add_song(self)
    @artist = artist
  end

  def genre=(genre)
    @genre = genre
    if !genre.songs.include?(self)
      genre.songs << self
    end
  end

  def self.find_by_name(name)
    self.all.detect {|song| song.name == name}
  end

  def self.find_or_create_by_name(name)
    song = self.find_by_name(name)
    if song == nil
      self.create(name)
    else
      song
    end
  end

  def self.new_from_filename(filename)
    names = filename.split(" - ")
    if !self.find_by_name(names[1])
      artist = Artist.find_or_create_by_name(names[0])
      genre = Genre.find_or_create_by_name(names[2].split(".")[0])
      song = self.new(names[1], artist, genre)
    end
  end

  def self.create_from_filename(filename)
    song = self.new_from_filename(filename)
    if !self.all.include?(song)
      self.all << song
    end
  end

end
