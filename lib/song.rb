require 'pry'

class Song

attr_accessor :name, :artist, :genre


  @@all = []

  def initialize(name, artist=nil, genre=nil)
    @name = name
    self.artist = artist if artist
    self.genre = genre if genre
  end

  def self.all
    @@all
  end

  def self.destroy_all
    @@all.clear
  end

  def self.create(name, artist=nil)
   song = self.new(name, artist)
   song.save
   song
  end

  def artist=(artist)
    @artist = artist
    artist.add_song(self)
  end

  def save
    @@all << self unless @@all.include?(self)

  end

  def genre=(genre)
    @genre=genre
    genre.add_song(self)
  end

  def self.find_by_name(name)
    all.detect{|song| song.name == name}

  end

  def self.find_or_create_by_name(name)
    if self.find_by_name(name) == nil
      self.create(name, artist = nil)
    else
      self.find_by_name(name)
    end
  end

  def self.new_from_filename(filename)
    songName = filename.split(" - ")[1]
    artistName = filename.split(" - ")[0]
    genreName = filename.split(" - ")[2].gsub(".mp3", "")
    artist = Artist.find_or_create_by_name(artistName)
    genre = Genre.find_or_create_by_name(genreName)
    self.new(songName, artist, genre)


  end

  def self.create_from_filename(filename)
    song = self.new_from_filename(filename)
    song.save
    song

  end


end
