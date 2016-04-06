require 'pry'
class Song
  attr_accessor :name, :artist, :genre, :filename
  @@all = []
  extend Concerns::Findable
  def initialize(name=nil, artist=nil, genre=nil)
    @name=name
    @artist=artist
    @genre = genre
    if @artist != nil
      self.artist.songs << self
    end
    if @genre != nil
      self.genre.songs << self
    end
  end
  def artist=(artist)
    if self.artist != nil
      self.artist
    else
      @artist=artist
      self.artist.add_song(self)
    end
  end
  def genre=(genre)
    if self.genre != nil
      self.genre
    else
      @genre=genre
      self.genre.songs << self
    end
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
  def self.new_from_filename(filename)
    songname = filename.split(" - ")[1]
    artistname = filename.split(" - ")[0]
    genrename = filename.split(" - ")[2]
    genrename = genrename.split(".")[0]
    new_artist = Artist.find_or_create_by_name(artistname)
    new_genre = Genre.find_or_create_by_name(genrename)
    new_song = Song.new(songname, new_artist, new_genre)
    new_song
  end
  def self.create_from_filename(filename)
    song = self.new_from_filename(filename)
    song.save
    song.artist.save
    song.genre.save
    song
  end
end
