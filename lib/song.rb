require 'pry'
class Song
  attr_accessor :name
  @@all = []

  def artist=(artist)
    @artist = artist
    @artist.add_song(self)
  end

  def artist
    @artist
  end

  def genre=(genre)
    @genre = genre
    @genre.songs << self unless @genre.songs.include?(self)
  end

  def genre
    @genre
  end

  def initialize(name, artist = nil, genre = nil)
    @name = name
    self.artist=(artist) unless artist == nil
    self.genre=(genre) unless genre == nil
  end

  def self.all
    @@all
  end

  def save
    @@all << self unless @@all.include?(self)
  end

  def self.destroy_all
     @@all.clear
  end

  def self.create(name)
    new_song = self.new(name)
    new_song.save
    new_song
  end

  def self.find_by_name(name)
    @@all.find {|song| song.name == name}
  end

  def self.find_or_create_by_name(name)
    if find_by_name(name) != nil
      find_by_name(name)
    else
      create(name)
    end
  end

  def self.new_from_filename(filename)
    song_name = filename.split(" - ")[1]
    new_song = Song.find_or_create_by_name(song_name)

    artist_name = filename.split(" - ")[0]
    new_song.artist = Artist.find_or_create_by_name(artist_name)

    genre_name = filename.split(" - ")[2].split(".")[0]
    new_song.genre = Genre.find_or_create_by_name(genre_name)

    new_song
  end

  def self.create_from_filename(filename)
    new_song = Song.new_from_filename(filename)
    new_song.save
    return new_song
  end
end
