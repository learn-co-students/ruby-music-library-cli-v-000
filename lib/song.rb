require 'pry'

class Song
  attr_accessor :name, :artist, :genre
  # attr_reader :artist, :genre

  @@all = []

  def initialize(name, artist = nil, genre = nil)
    @name = name
    self.genre = genre if genre
    self.artist = artist if artist
  end

  def self.all
    @@all
  end

  def self.destroy_all
    all.clear
  end

  def save
    @@all << self
  end

  def self.create(name)
    song = self.new(name)
    song.save
    song
  end

  def artist=(artist)
    @artist = artist
    artist.add_song(self)
  end

  def genre=(genre)
    @genre = genre
    if !genre.songs.include?(self)
      genre.songs << self
    end
    # binding.pry
  end

  def self.find_by_name(name)
    all.detect { |song| song.name == name }
  end

  def self.find_or_create_by_name(name)
    if self.find_by_name(name)
      self.find_by_name(name)
    else self.create(name)
    end
  end

  def self.new_from_filename(name)

      new_instance = self.new(name.scan(/(\w+\s\w+\s\w+\s\w+\s)/).join)
      # new_instance = self.new(name.scan(/^(\w+ \w+)/).join)

      new_instance
    end
end
