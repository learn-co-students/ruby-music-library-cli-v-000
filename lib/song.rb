require 'pry'

class Song
  attr_accessor :name

  @@all = Array.new

  def initialize(name, artist = nil, genre = nil)
    @name = name
    #@genre = genre
    @@all << self

    !artist.nil? ? self.artist=(artist) : @artist = artist

    !genre.nil? ? self.genre=(genre) : @genre = genre
  end

  def self.all
    @@all
  end

  def self.destroy_all
    @@all.clear
  end

  def self.create(name)
    self.new(name).save
    return self
  end

  def self.find_by_name(name)
    self.all.find { |song| song.name == name }
  end

  def self.find_or_create_by_name(name)

  end

  def save
    @@all << self
  end

  def artist
    @artist
  end

  def artist=(artist)
    if artist.is_a?(Artist)
      @artist = artist
      artist.add_song(self)
    end
  end

  def genre
    @genre
  end

  def genre=(genre)
    if genre.is_a?(Genre)
      @genre = genre
      genre.songs << self if !genre.songs.include?(self)
    end
  end
end
