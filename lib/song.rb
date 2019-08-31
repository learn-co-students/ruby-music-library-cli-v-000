require 'pry'

class Song
  attr_accessor :name
  attr_reader :artist, :genre

  @@all = []
  # binding.pry

  def initialize(name, artist = nil, genre = nil)
    @name = name
    self.genre = genre if genre
    self.artist = artist if artist
  end

  def self.all
    @@all
    # binding.pry
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

  def self.new_from_filename(filename)
      artist, song, genre = filename.split(" - ")
      new_instance = self.new(song)
      new_instance.artist_name = artist
      new_instance.genre_name = genre
      new_instance
      # binding.pry
  end

  def artist_name=(name)
    self.artist = Artist.find_or_create_by_name(name)
    artist.add_song(self)
  end

  def genre_name=(name)
     self.genre = Genre.find_or_create_by_name(name.gsub(".mp3", ""))
    #  binding.pry
     genre.songs
  end

  def self.create_from_filename(filename)
    # self.new_from_filename(filename)
    # artist, song, genre = filename.split(" - ")
    # new_instance = self.new(song)
    # new_instance.artist_name = artist
    # new_instance.genre_name = genre
    # new_instance
    @@all << self.new_from_filename(filename)
    # binding.pry
  end

end
