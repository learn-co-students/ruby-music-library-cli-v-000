require 'pry'

class Song

  attr_accessor :name, :artist, :genre
  @@all = []

  extend Concerns::Findable

  def initialize(name,artist = nil, genre = nil)
    @name = name
    self.artist = artist if artist
    self.genre = genre if genre
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

  def self.create(name, artist = nil, genre = nil)
    self.new(name, artist, genre).tap{|s| s.save}
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
  end

  def self.new_from_filename(file_name)
    song = file_name.split(" - ")
    name = song[1]
    artist = Artist.find_or_create_by_name(song[0])
    genre = Genre.find_or_create_by_name(song[2].gsub(".mp3",""))
    self.new(name, artist, genre)
  end

  def self.create_from_filename(file_name)
    song = file_name.split(" - ")
    name = song[1]
    artist = Artist.find_or_create_by_name(song[0])
    genre = Genre.find_or_create_by_name(song[2].gsub(".mp3",""))
    self.create(name, artist, genre)
  end

end
