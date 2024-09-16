require 'pry'
class Song
  attr_accessor :name, :artist, :genre
  @@all = []

  extend Concerns::Findable

  def initialize(name, artist=nil, genre=nil)
    @name = name
    if artist
      self.artist=(artist)
    end
    if genre
      self.genre=(genre)
    end
  end

  def self.all
    @@all
  end

  def save
    @@all << self
  end

  def artist=(artist)
    @artist = artist
    artist.add_song(self)
    #unless artist.songs.include?(self)
    #song.artist = self unless song.artist
    #song.artist == artist
  end

  def genre=(genre)
    @genre = genre
    genre.songs << self unless genre.songs.include?(self)
  end

  def self.create(name)
    song = Song.new(name)
    song.save
    song
  end

  def self.destroy_all
    @@all.clear
  end

  def self.find_by_name(name)
    @@all.detect {|song| song.name == name}
  end

  def self.find_or_create_by_name(name)
    if self.find_by_name(name)
      Song.find_by_name(name)
    else
      self.create(name)
    end
  end

  def self.new_from_filename(filename)
    artist_name, name, genre_name = filename.split(" - ")
    #genre = genre1.chomp
    #binding.pry
    artist = Artist.find_or_create_by_name(artist_name)
    genre = Genre.find_or_create_by_name(genre_name.gsub(".mp3", ""))
    new_song = self.new(name, artist, genre)
    #new_song.artist = artist
    #new_song.genre = genre
  end

  def self.create_from_filename(filename)
    new_song = self.new_from_filename(filename)
    new_song.save
  end
end
