require 'pry'

class Song
  extend Concerns::Findable
  attr_accessor :name, :artist, :genre

  @@all = []

  def initialize(name, artist=nil, genre=nil)
    @name = name
    artist.add_song(self) unless artist.nil?
    self.genre=(genre) unless genre.nil?
  end

  def save
    self.class.all << self
  end

  def self.create(name)
    song = Song.new(name)
    song.save
    song
  end

  def self.new_from_filename(file)
    song_properties = file.split(" - ")
    artist = song_properties[0]
    song_name = song_properties[1]
    genre = song_properties[2].gsub(".mp3","")

    song = Song.new(song_name) unless self.find_by_name(song_name)
    song.artist = Artist.find_or_create_by_name(artist)
    song.genre = Genre.find_or_create_by_name(genre)
    song
  end

  def self.create_from_filename(file)
    song_properties = file.split(" - ")
    artist = song_properties[0]
    song_name = song_properties[1]
    genre = song_properties[2].gsub(".mp3","")

    song = Song.find_or_create_by_name(song_name)
    song.artist = Artist.find_or_create_by_name(artist)
    song.genre = Genre.find_or_create_by_name(genre)
    song
  end

  def artist=(artist)
    @artist = artist
    @artist.add_song(self)
  end

  def genre=(genre)
    @genre = genre
    @genre.songs << self unless @genre.songs.include?(self)
  end

  def self.all
    @@all
  end

  def self.destroy_all
    all.clear
  end
end
