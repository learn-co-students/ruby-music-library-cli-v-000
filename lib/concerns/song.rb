require 'pry'
class Song
  attr_accessor :name
  attr_reader :artist, :genre

  @@all = []
  def initialize(name, artist=nil, genre=nil)
    @name = name
    self.artist=(artist) if artist!=nil
    self.genre=(genre) if genre!=nil
  end

  def genre=(genre)
    @genre = genre
    genre.songs << self unless genre.songs.include?(self)
  end

  def artist=(artist)
    @artist = artist
    artist.add_song(self)
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
    new_song = Song.new(name)
    new_song.save
    new_song
  end

  def self.find_by_name(song)
    all.find {|s|s.name == song}
  end

  def self.find_or_create_by_name(song)
  find_by_name(song) || create(song)
  end

  def self.new_from_filename(filename)
     x = filename.chomp(".mp3")
     artist, name, genre = x.split(" - ")
     artist = Artist.find_or_create_by_name(artist)
     genre = Genre.find_or_create_by_name(genre)
     new(name, artist, genre)
  end

  def self.create_from_filename(filename)
    new_from_filename(filename).save
  end

end
