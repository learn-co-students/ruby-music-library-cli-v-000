require 'pry'

class Song

  extend Concerns::Findable

  attr_accessor :name
  @@all = []

  def initialize(name, artist = nil, genre = nil)
    @name = name
    if artist
      self.artist=(artist)
    end
    if genre
      self.genre=(genre)
    end
    self.save
  end

  def artist=(artist)
    @artist = artist
    artist.add_song(self)
  end

  def artist
    @artist
  end

  def genre
    @genre
  end

  def genre=(genre)
    @genre = genre
    if genre.songs.include?(self) == false
      genre.songs << self
    end
  end

  def self.all
    @@all
  end

  def self.destroy_all
    @@all.clear
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
    all.detect {|song| song.name == name}
  end

  def self.find_or_create_by_name(name)
    # self.find_by_name(name) ? self.find_by_name(name) : self.create(name)
    if find_by_name(name)
      find_by_name(name)
    else
      create(name)
    end
  end

  def self.create_from_filename(filename)
      song = self.new_from_filename(filename)
      @@all << song
      song
  end

  def self.new_from_filename(filename)
      parts = filename.split(" - ")
      song_name = self.find_or_create_by_name(parts[1])
      binding.pry
      artist = Artist.find_or_create_by_name(parts[0])
      genre = Genre.find_or_create_by_name(parts[2].delete ".mp3")
      song = Song.new(song_name, artist, genre)
      song
      #binding.pry
    end

end
