require 'concerns/findable.rb'

class Song
  extend Concerns::Findable

  attr_accessor :name, :artist, :genre

  @@all = []

  def initialize(name, artist = nil, genre = nil)
    @name = name
    self.artist=(artist) unless artist == nil
    self.genre=(genre) unless genre == nil
  end

  def artist=(artist)
    @artist = artist
    artist.add_song(self)
  end

  def genre=(genre)
    @genre = genre
    genre.add_song(self)
  end

  def save
    @@all << self
  end
  
  def self.all
    @@all
  end

  def self.destroy_all
    @@all.clear
  end

  def self.create(name)
    Song.new(name).tap{|x| x.save}
  end

  def self.new_from_filename(name)
    file_arr = name.split(/\s[-]\s/)
    song_name = file_arr[1].strip
    artist_name = file_arr[0].strip
    genre_name = file_arr[2].gsub(".mp3","").strip
    
    artist = Artist.find_or_create_by_name(artist_name)
    genre = Genre.find_or_create_by_name(genre_name)
    Song.new(song_name, artist, genre)
  end

  def self.create_from_filename(name)
    file_arr = name.split(/\s[-]\s/)
    song_name = file_arr[1].strip
    artist_name = file_arr[0].strip
    genre_name = file_arr[2].gsub(".mp3","").strip
    
    artist = Artist.find_or_create_by_name(artist_name)
    genre = Genre.find_or_create_by_name(genre_name)
    Song.new(song_name, artist, genre).tap{|x| x.save}
  end
end