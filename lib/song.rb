require 'pry'

class Song
  include Concerns::InstanceMethods
  extend Concerns::ClassMethods
  extend Concerns::Findable

  attr_accessor :name
  attr_reader :artist, :genre
  @@all= []

  def self.all
    @@all
  end

  def initialize(name, artist = nil, genre = nil)
    self.name=name
    self.genre=genre unless genre == nil
    self.artist= artist unless artist == nil
  end

  def artist= (artist)
    @artist = artist
    artist.add_song(self)
  end

  def genre= (genre)
    @genre = genre
    genre.songs<<self unless genre.songs.include?(self)
  end


  def self.new_from_filename(filename)
      artist_name, song_name, genre_name = filename.split(" - ")
      genre_name = genre_name.gsub(".mp3", "")
      s = Song.new(song_name)
      a = Artist.find_or_create_by_name(artist_name)
      g = Genre.find_or_create_by_name(genre_name)
      s.artist = a
      s.genre = g
      s
  end

  def self.create_from_filename(filename)
    s = self.new_from_filename(filename)
    s.save
  end

end
