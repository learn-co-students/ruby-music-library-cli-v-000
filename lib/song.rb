require 'pry'

class Song
  attr_accessor :name
  attr_reader :artist, :genre

  @@all = []

  def initialize(name, artist=nil, genre=nil)
    @name = name
    artist != nil ? self.artist= artist : nil
    genre != nil ? self.genre= genre : nil

    save
  end

  def self.find_by_name(name)
    all.detect {|s| s.name == name}
  end

  def self.find_or_create_by_name(name)
    find_by_name(name) == nil ? create(name) : find_by_name(name)
  end

  def self.all
    @@all
  end

  def save
    @@all << self
  end

  def self.destroy_all
    @@all.clear
  end

  def self.create(name)
    name = self.new(name)
  end

  def artist=(artist)
    @artist = artist
    artist.add_song(self)
  end

  def genre=(genre)
    @genre = genre
    if genre == ""
      genre = Genre.new(genre)
      genre.songs << self
    else
      genre.songs << self unless genre.songs.include?(self)
    end
  end

  def self.new_from_filename(filename)
    file_song = filename.split(" - ")[1]
    file_artist = filename.split(" - ")[0]
    file_genre = filename.split(" - ")[2].gsub(".mp3", "")
    a = Artist.find_or_create_by_name(file_artist)
    g = Genre.find_or_create_by_name(file_genre)
    song = Song.new(file_song, a, g)
  end

  def self.create_from_filename(filename)
    self.new_from_filename(filename).save
  end
end
