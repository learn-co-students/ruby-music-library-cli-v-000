require_relative './concerns/findable.rb'


class Song
  extend Concerns::Findable
  attr_accessor :name
  attr_reader :artist, :genre


  @@all = []

  def initialize(name, artist = nil, genre = nil)
    @name = name
    @artist = artist
    if artist
      self.artist = artist
    end
    if genre
      self.genre = genre
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
    self.genre == genre
    if !genre.songs.include?(self)
      genre.songs << self
    end
  end

  def self.new_from_filename(filename)
  new_filename = filename.gsub(".mp3","")
  artist_name, song_name, genre_name = new_filename.split(" - ")

   artist = Artist.find_or_create_by_name(artist_name)
   genre = Genre.find_or_create_by_name(genre_name)

   new(song_name, artist, genre)
  end

  def self.create_from_filename(filename)
    new_from_filename(filename).tap{|s|s.save}
  end

end
