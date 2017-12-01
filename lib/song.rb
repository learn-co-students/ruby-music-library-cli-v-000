require 'pry'
class Song
  attr_accessor :name, :genre, :artist
  attr_reader

  @@all = []

  def initialize(name, artist_name=nil, genre_name = nil)
    @name = name
    self.artist=(artist_name) unless artist_name == nil
    self.genre=(genre_name) unless genre_name == nil
  end

  def artist=(artist)
    @artist = artist
    artist.add_song(self)
  end

  def genre=(genre)
    @genre = genre
    genre.songs << self unless genre.songs.include?(self)
  end

  def artist_name=(artist_name)
    self.artist = Artist.find_or_create_by_name(artist_name)
  end

  def genre_name=(genre_name)
    self.genre = Genre.find_or_create_by_name(genre_name)
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
    Song.new(name).tap do |song|
      song.save
    end
  end

  def self.new_from_filename(filename)
    new_song = filename.chomp(".mp3").split("-")
    artist = new_song[0].strip
    name = new_song[1].strip
    genre = new_song[2].strip

    song = Song.new(name)
    song.artist_name = artist
    song.genre_name = genre

    song
  end

  def self.create_from_filename(filename)
    song = self.new_from_filename(filename)
    song.save
  end

end
