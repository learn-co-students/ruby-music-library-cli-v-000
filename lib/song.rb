require 'pry'

class Song

  @@all = []
  attr_accessor :name, :artist, :genre

  def initialize(name, artist=nil, genre=nil)
    @name = name
    @artist = artist
    @genre = genre
    self.artist = artist if artist != nil
    #unless artist.nil?
    #  artist.add_song(self)
    #end
    unless genre.nil?
      genre.add_song(self)
    end
  end

  def artist=(artist)
    @artist = artist
    artist.add_song(self)
  end

#  def artist_name=(name)
#    self.artist = Artist.find_or_create_by_name(name)
#    artist.add_song(self)
#  end

  #def genre_name=(name)
  #  self.genre = Genre.find_or_create_by_name(name)
  #  genre.add_song(self)
  #end

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
    song = Song.new(name)
    song.save
    song
  end

  def self.find_by_name(name)
    self.all.find {|song| song.name == name }
  end

  def self.find_or_create_by_name(name)
    if self.find_by_name(name).nil?
      self.create(name)
    else
      self.find_by_name(name)
    end
  end

  def self.new_from_filename(filename)
    artist, song, genre = filename.split(" - ")
    genre = genre.split(".")[0]
  #  new_song = self.new(song)

    artist_object = Artist.find_or_create_by_name(artist)
    genre_object = Genre.find_or_create_by_name(genre)
    new_song = self.new(song, artist_object, genre_object)
    #new_song.artist_name = artist
    #new_song.genre_name = genre
    new_song
  end

  def self.create_from_filename(filename)
    #artist, song, genre = filename.split(" - ")
    #genre = genre.split(".")[0]
    #new_song = self.new(song)
    #new_song.artist_name = artist
    #new_song.genre_name = genre
    #new_song.save
    song = self.new_from_filename(filename)
    song.save
    song
  end

end
