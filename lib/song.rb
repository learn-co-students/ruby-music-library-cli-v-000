require 'pry'
class Song
  attr_accessor :name, :genre, :artist

  @@all = Array.new

  def initialize(name, artist=nil, genre=nil)
    @name = name
    genre != nil ? self.genre = genre : nil;
    artist != nil ? self.artist = artist : nil
  end

  def name=(new_name)
    @name = new_name
  end

  def genre=(genre)
    @genre = genre
    genre.add_song(self)
  end

  def artist=(artist)
    artist.add_song(self)
    @artist = artist
  end
  def save
     @@all << self
    end

  def self.all
    @@all
  end

  def self.destroy_all
    @@all = Array.new
  end

  def self.create(name, artist=nil, genre=nil)
    new_song = Song.new(name, artist, genre)
    new_song.save
    new_song
  end

  def self.find_by_name(name)
    @@all.find do |song|
      song.name == name
    end
  end

  def self.find_or_create_by_name(name)
    found_song = Song.find_by_name(name)
    if !found_song
      new_song = Song.create(name)
      new_song
    else
      found_song
    end
  end

  def self.new_from_filename(filename)
    data = filename.split(" - ")
    artist = Artist.find_or_create_by_name(data[0])
    data[2].slice! ".mp3";
    genre = Genre.find_or_create_by_name(data[2])
    song = Song.create(data[1], artist, genre)
    song
  end

  def self.create_from_filename(filename)
    self.new_from_filename(filename)
  end

end
