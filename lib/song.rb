require 'pry'
class Song
  extend Concerns::Findable

  attr_accessor :name
  attr_reader :artist, :genre

  @@all = []

  def initialize(name,artist=nil,genre=nil)
    @name = name
    @artist = artist
    if self.artist
      self.artist = artist
    end
    @genre = genre
    if self.genre
      self.genre = genre
    end
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

  def self.create(name, artist = nil, genre = nil)
    new(name, artist, genre).tap{|s| s.save}
  end

  def artist=(artist)
    @artist = artist
    artist.add_song(self) unless artist.songs.include?(self)
  end

  def genre=(genre)
    @genre = genre
    genre.songs << self unless genre.songs.include?(self)
  end

  def self.new_from_filename(filename)
    song_attributes = filename.split(" - ")
    artist_name, song_name, genre_name = song_attributes[0], song_attributes[1], song_attributes[2].gsub(".mp3","")
    
    artist = Artist.find_or_create_by_name(artist_name)
    genre = Genre.find_or_create_by_name(genre_name)
    self.new(song_name, artist, genre)
  end

  def self.create_from_filename(filename)
    song_attributes = filename.split(" - ")
    artist_name, song_name, genre_name = song_attributes[0], song_attributes[1], song_attributes[2].gsub(".mp3","")
    
    artist = Artist.find_or_create_by_name(artist_name)
    genre = Genre.find_or_create_by_name(genre_name)
    self.create(song_name, artist, genre)
  end

end