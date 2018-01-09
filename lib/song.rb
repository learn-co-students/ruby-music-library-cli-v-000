require 'pry'

class Song

  attr_accessor :name, :genre
  attr_reader :artist

  @@all = []

  def artist=(artist)
    @artist = artist
    self.artist.add_song(self)
  end

  def genre=(genre)
    @genre = genre
    if genre.songs.include?(self) ? nil : genre.songs << self
    end
  end

  def initialize(name, artist = nil, genre = nil)
    @name = name
    @genre = genre
    if artist != nil
      self.artist=(artist)
    end
    if genre != nil
      self.genre=(genre)
    end
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
    self.new(name).tap{|song| song.save}
  end

  def self.find_by_name(name)
    @@all.find{|song| song.name == name}
  end

  def self.find_or_create_by_name(name)
    self.find_by_name(name) || self.create(name)
  end

  def self.new_from_filename(filename)
    attributes = filename.split(" - ")
    artist = Artist.find_or_create_by_name(attributes[0])
    genre = Genre.find_or_create_by_name(attributes[2].split(".")[0])
    song = self.new(attributes[1], artist, genre)
  end

  def self.create_from_filename(filename)
    self.new_from_filename(filename).save
  end

end
