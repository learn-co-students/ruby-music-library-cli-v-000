require "pry"

class Song
  extend Concerns::Findable
  attr_accessor :name, :artist, :genre
  @@all = []

  def initialize(name, artist = nil, genre = nil)
    @name = name
    self.artist = artist if artist
    #name.add_song(self) unless name.songs.include?(self)
    self.genre = genre if genre
  end

  def artist=(name)
    @artist = name
    name.add_song(self)
  end

  def genre=(genre)
    @genre = genre
    genre.songs << self unless  genre.songs.include?(self)#genre.songs.detect{|x| x = genre} #works using a single = but not a comparator??? seems wrong to me
    #song.artist = self unless song.artist #.include?(self)
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
    song = Song.new(name)
    song.save
    song
  end

  def self.new_from_filename(file)
    artist_name = file.split(" - ")[0]
    song_name = file.split(" - ")[1]
    genre_name = file.split(' - ')[2].gsub(".mp3", "")
    artist = Artist.find_or_create_by_name(artist_name)  #unless Artist.all.include?(artist) ****find or create takes care of thist
    genre = Genre.find_or_create_by_name(genre_name) # unless Genre.all.include?(genre)
    song = self.new(song_name, artist, genre)
    song
  end

  def self.create_from_filename(file)
    new_from_filename(file).save
  end
end
