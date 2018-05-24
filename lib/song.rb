require 'pry'

# class Song
#   attr_accessor :name, :genre, :artist
#
#   def initialize(name, artist = nil, genre = nil)
#     @name = name
#     self.artist=(artist)
#     self.genre=(genre)
#     @@all = []
#   end
#
#   def artist=(artist)
#     @artist = artist
#     if artist != nil
#       artist.add_song(self)
#     end
#   end
#
#   def artist
#     @artist
#   end
#
#   def genre=(genre)
#     @genre = genre
#     if genre != nil && !genre.songs.include?(self)
#       genre.songs << self
#     end
#   end
#
#   def self.all
#     @@all
#   end
#
#   def self.destroy_all
#     @@all = []
#   end
#
#   def save
#     @@all << self
#   end
#
#   def self.create(song_name)
#     song = self.new(song_name)
#     self.all << song
#     song
#   end
#
#   def self.find_by_name(song_name)
#     self.all.detect do |song|
#       song.name == song_name
#     end
#   end
#
#   def self.find_or_create_by_name(song_name)
#     if self.find_by_name(song_name)
#       self.find_by_name(song_name)
#     else
#       self.create(song_name)
#     end
#   end
#
#   def self.new_from_filename(filename)
#     filename_array = filename.chomp(".mp3").split(" - ")
#     artist = Artist.find_or_create_by_name(filename_array[0])
#     genre = Genre.find_or_create_by_name(filename_array[2])
#     song = self.new(filename_array[1], artist, genre)
#     song
#   end
#
#   # def self.create_from_filename(filename)
#   #   filename_array = filename.chomp(".mp3").split(" - ")
#   #   artist = Artist.find_or_create_by_name(filename_array[0])
#   #   genre = Genre.find_or_create_by_name(filename_array[2])
#   #   song = self.create(filename_array[1])
#   #   song
#   # end
#
# end

class Song
  attr_accessor :name
  attr_reader :artist, :genre

  @@all = []

  def initialize(name, artist = nil, genre = nil)
    @name = name
    self.artist = artist if artist
    self.genre = genre if genre
  end

  def artist=(artist)
    @artist = artist
    artist.add_song(self)
  end

  def genre=(genre)
    @genre = genre
    genre.songs << self unless genre.songs.include?(self)
  end

  def self.all
    @@all
  end

  def self.destroy_all
    all.clear
  end

  def save
    self.class.all << self
  end

  def self.create(name)
    song = new(name)
    song.save
    song

    # Or, as a one-liner:
    # new(name).tap{ |s| s.save }
  end

  def self.find_by_name(name)
    all.detect{ |s| s.name == name }
  end

  def self.find_or_create_by_name(name)
    find_by_name(name) || create(name)
  end

  def self.new_from_filename(filename)
    parts = filename.split(" - ")
    artist_name, song_name, genre_name = parts[0], parts[1], parts[2].gsub(".mp3", "")

    artist = Artist.find_or_create_by_name(artist_name)
    genre = Genre.find_or_create_by_name(genre_name)

    new(song_name, artist, genre)
  end

  def self.create_from_filename(filename)
    new_from_filename(filename).tap{ |s| s.save }
  end
end
