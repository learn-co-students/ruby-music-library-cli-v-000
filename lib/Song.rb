require 'pry'
class Song
  extend Concerns::Findable
  attr_accessor :name, :artist, :genre

  @@all = []

  def initialize(name, artist=nil, genre=nil)
    @name = name
    self.artist = artist if artist
    self.genre = genre if genre
  end

  def self.all
    @@all
  end

  def artist=(artist)
    @artist = artist
    artist.add_song(self)
  end

  def genre=(genre)
    genre.songs << self unless genre.songs.include?(self)
    @genre = genre
  end

  def self.destroy_all
    @@all.clear
  end

  def save
    @@all << self
  end

  def self.find_by_name(name)
    self.all.detect do |i|
      i.name == name
    end
  end

  def self.find_or_create_by_name(name)
    self.find_by_name(name) || self.create(name)
  end

  def self.create(name, artist = nil, genre = nil)
    self.new(name, artist, genre).tap{|i| i.save}
  end

  def self.new_from_filename(file_name)
    #binding.pry
    info = file_name.split(" - ")
    artist_name = info.first.gsub(".mp3", "")
    song_name = info[1].gsub(".mp3", "")
    genre_name = info[2].gsub(".mp3", "")
    artist = Artist.find_or_create_by_name(artist_name)
    genre = Genre.find_or_create_by_name(genre_name)
    self.new(song_name, artist, genre)
  end

  def self.create_from_filename(file_name)
    info = file_name.split(" - ")
    artist_name = info.first.gsub(".mp3", "")
    song_name = info[1].gsub(".mp3", "")
    genre_name = info[2].gsub(".mp3", "")
    artist = Artist.find_or_create_by_name(artist_name)
    genre = Genre.find_or_create_by_name(genre_name)
    self.create(song_name, artist, genre)
  end

  def to_s
    "#{self.artist.name} - #{self.name} - #{self.genre.name}"
  end

end
