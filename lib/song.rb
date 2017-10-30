require 'pry'

class Song
  extend Concerns::Findable

  attr_accessor :name, :genre
  attr_reader :artist

  @@all = []

  def initialize(name, artist=nil, genre=nil)
    @name = name
    self.artist = artist unless artist == nil
    self.genre = genre unless genre == nil
  end

  def self.all
    @@all
  end

  def self.destroy_all
    self.all.clear
  end

  def save
    self.class.all << self
  end

  def self.create(name)
    song = Song.new(name)
    song.save
    song
  end

  def artist=(artist)
    @artist = artist
    self.artist.add_song(self) unless self.artist.songs.include?(self)
  end

  def genre=(genre)
    @genre = genre
    self.genre.songs << self unless self.genre.songs.include?(self)
  end

  def self.new_from_filename(filename)
    filename_array = filename.split(/\s-\s|\.mp3/)
    @song_name, @artist_name, @genre_name = filename_array[1], filename_array[0], filename_array[2]
    new_song = Song.find_by_name(@song_name)
    if new_song
      new_song.artist = Artist.find_or_create_by_name(@artist_name)
      new_song.genre = Genre.find_or_create_by_name(@genre_name)
    else
      new_song = Song.new(@song_name)
      new_song.artist = Artist.find_or_create_by_name(@artist_name)
      new_song.genre = Genre.find_or_create_by_name(@genre_name)
    end
    new_song
  end

  def self.create_from_filename(filename)
    new_from_filename(filename).save
  end
end
