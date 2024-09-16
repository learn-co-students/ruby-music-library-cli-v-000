require 'pry'
class Song

  attr_accessor :name, :artist, :genre

  @@all = []

  def initialize(name, artist=nil, genre=nil)
    @name = name
    if artist != nil 
      self.artist = artist
    end
    if genre != nil
      self.genre = genre
    end
  end

  def self.find_by_name(name)
    self.all.detect do |song|
      song.name == name
    end
  end

  def self.find_or_create_by_name(name)
    self.find_by_name(name)||self.create(name)
  end

  def self.all
    @@all
  end

  def self.new_from_filename(filename)
    filename_1 = filename.split(' - ')
    song = self.new(filename_1[1])
    song.artist = Artist.find_or_create_by_name(filename_1.first)
    genre_array = filename_1.last.split('.')
    song.genre = Genre.find_or_create_by_name(genre_array.first)
    song
  end

  def self.create_from_filename(filename)
    song = self.new_from_filename(filename)
    @@all << song
  end

  def artist=(artist)
    @artist=artist
    artist.add_song(self)
  end

  def genre=(genre)
    @genre = genre
    if genre.songs.include?(self)
      nil
    else
    genre.songs << self
    end
  end

  def self.destroy_all
    @@all = []
  end

  def save
    @@all << self
  end

  def self.create(name)
    song = Song.new(name)
    @@all << song
    song
  end

  def to_s
    "#{artist.name} - #{name} - #{genre.name}"
  end
end
