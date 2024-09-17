require_relative '../config/environment'

class Song


  extend Concerns::Findable


  attr_accessor :name, :artist, :genre

  @@all = []

  def initialize(name, artist = nil, genre = nil)
    @name = name
    self.artist = artist
    self.genre = genre
  end

  def self.all
    @@all
  end

  def self.destroy_all
    @@all.clear
    @all
  end

  def save
    @@all << self
  end

  def self.create(name)
    song = self.new(name)
    self.all << song
    song
  end

  def artist=(artist)
    @artist = artist
    if !artist.nil?
      artist.add_song(self)
  end
end

def genre=(genre)
  @genre = genre
  if !genre.nil?
    genre.songs << self if not genre.songs.include?(self)
  end
end

def self.find_by_name(name)
    @@all.detect{|a| a.name == name}
  end

  def self.find_or_create_by_name(name)
    self.find_by_name(name)? self.find_by_name(name) : self.create(name)
  end

  def self.new_from_filename(name)
    name = name.chomp(".mp3").split(" - ")
    check = find_by_name(name)
    return Song.new(name[1], Artist.find_or_create_by_name(name[0]), Genre.find_or_create_by_name(name[2])) if check.nil?
    check
  end

  def self.create_from_filename(name)
    file = Song.new_from_filename(name)
    @@all << file
    file
  end

end
