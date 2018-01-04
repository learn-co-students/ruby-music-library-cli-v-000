require 'pry'
class Song
@@all = []
attr_accessor :name, :genre, :artist


  def initialize(name, artist = nil, genre = nil)
    @name = name
    self.artist = artist if artist
    self.genre = genre if genre
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
  end

  def genre=(genre)
    @genre = genre
    genre.add_song(self)
  end

  def self.destroy_all
    @@all.clear
  end

  def self.create(name)
    s = self.new(name)
    s.save
    s
  end

  def self.find_by_name(name)
    self.all.detect {|s| name == s.name}
  end

  def self.find_or_create_by_name(name)
    if self.find_by_name(name) == nil
      self.create(name)
    else self.find_by_name(name)
    end
  end

  def self.new_from_filename(song_mp3)
    song = song_mp3.split(" - ")
    song_name = song[1]
    artist = Artist.find_or_create_by_name(song[0])
    genre = Genre.find_or_create_by_name(song[2].gsub(".mp3", ""))
    new(song_name, artist, genre)
  end

  def self.create_from_filename(filename)
    new_from_filename(filename).tap{ |s| s.save }
  end

end
