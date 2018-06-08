require "pry"
class Song

  attr_accessor :name, :artist, :genre


  @@all = []

  def initialize(name, artist = nil, genre = nil)
    @name = name
    self.artist = artist if artist
    self.genre = genre if genre
  end

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.destroy_all
    @@all.clear
  end

  def self.create(name)
    create = new(name)
    create.save
    create
  end

  def artist=(artist)
    @artist = artist
    artist.add_song(self) if !artist.songs.include?(self)
  end

  def genre
    @genre
  end

  def genre=(genre)
    @genre = genre
    genre.add_song(self) if !genre.songs.include?(self)
  end

  def self.find_by_name(name)
    @@all.find{|song| song.name == name}
  end

  def self.find_or_create_by_name(name)
  if find_this = self.find_by_name(name)
        find_this
    else
      self.create(name)
    end
  end

  def self.new_from_filename(filename)
    artist, song, genre_name = filename.split(" - ")
    name = genre_name.gsub(".mp3", "")
    artist = Artist.find_or_create_by_name(artist)
    genre = Genre.find_or_create_by_name(name)
    new(song, artist, genre)
  end

  def self.create_from_filename(name)
    self.new_from_filename(name).save
  end
end
