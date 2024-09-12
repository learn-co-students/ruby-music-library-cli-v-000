require 'pry'

class Song
  attr_accessor :name
  attr_reader :artist, :genre
  @@all = []

  def initialize(name, artist=nil, genre=nil)
    @name = name
    self.artist = artist if artist
    self.genre = genre if genre
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

  def self.create(name, artist=nil, genre=nil)
    song = self.new(name, artist, genre)
    song.save
    song
  end

  def artist=(artist)
    @artist = artist
    artist.add_song(self) unless artist.songs.include?(self)
  end

  def genre=(genre)
    @genre = genre
    genre.songs << self unless genre.songs.include?(self)
  end

#  def self.new_by_name(name)
#    song = self.new
#    song.name = name
#    song
#  end

#  def self.create_by_name(name)
#    song = self.new
#    song.name = name
#    @@all << song
#    song
#  end

  def self.find_by_name(name)
    self.all.detect{|song| song.name == name}
  end

  def self.find_or_create_by_name(name)
    find_by_name(name) || create(name)
  end

#  def self.alphabetical
#    self.all.sort_by{ |i| i.name }
#  end

  def self.new_from_filename(filename)
    file_array = filename.split(" - ")
    song_artist = Artist.find_or_create_by_name(file_array[0])
    song_genre = Genre.find_or_create_by_name(file_array[2].split(".mp3")[0])
    song = Song.new(file_array[1], song_artist, song_genre)
  end

  def self.create_from_filename(filename)
    song = new_from_filename(filename)
    song.save
    song
  end
end
