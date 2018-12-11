class Song
  extend Concerns::Findable
  extend Concerns::Transformation
  attr_accessor :name, :genre, :artist
  require 'pry'

  @@all = []

  def initialize(name, artist=nil, genre=nil)
    @name = name

    if artist.class == String
      self.artist = find_or_create_by_name(artist)
    else
      self.artist = artist unless artist == nil
    end

    if genre.class == String
      self.genre = find_or_create_by_name(genre)
    else
      self.genre = genre unless genre == nil
    end

  end

  def self.all
    @@all
  end

  def self.destroy_all
    @@all = []
  end

  def save
    @@all << self
  end

  def self.create(name)
    new_song = self.new(name)
    new_song.save
    new_song
  end

  def genre=(genre)
    genre.songs << self
  end

  def artist=(artist)
    @artist = artist
    artist.add_song(self)
  end

  def genre=(genre)
    if genre.class == Genre
      @genre = genre
      @genre.add_song(self)
    else
      @genre = Genre.create(genre)
      @genre.add_song(self)
    end
  end

  def self.new_from_filename(filename)
      song_split = split_song(filename)
      song = self.find_or_create_by_name(song_split[1])
      song.artist = Artist.find_or_create_by_name(song_split[0])
      song.genre = Genre.find_or_create_by_name(song_split[2])
      song
  end

  def self.create_from_filename(filename)
    self.new_from_filename(filename)

  end
end
