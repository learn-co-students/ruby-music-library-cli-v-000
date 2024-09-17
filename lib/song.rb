require 'pry'

class Song

  attr_accessor :name
  attr_reader :artist, :genre

  extend Concerns::Findable

  @@all = []

  def initialize(name, artist = nil, genre = nil)
    @name = name
    @artist = artist
    if artist != nil
      artist.add_song(self)
    end
    @genre = genre
    if genre !=nil
      genre.add_song(self)
    end
  end

  def self.create(name)
    song = Song.new(name)
    song.save
    song
  end

  def self.all
    @@all
  end

  def self.destroy_all
    self.all.clear
  end

  def self.new_from_filename(name)
    song_name = name.split(" - ")[1]
    art = name.split(" - ")[0]
    gen = name.split(" - ")[2][0..-5]
    artist = Artist.find_or_create_by_name(art)
    genre = Genre.find_or_create_by_name(gen)
    song = self.new(song_name,artist,genre)
    song
  end

  def self.create_from_filename(new_song)
    n_song = Song.new_from_filename(new_song)
    n_song.save
    n_song
  end

  def save
    @@all.push(self)
  end

  def artist=(artist)
    @artist = artist
    artist.add_song(self)
  end

  def genre=(genre)
    @genre = genre
    genre.add_song(self)
  end

end
