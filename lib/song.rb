require 'pry'

class Song
  attr_accessor :name
  attr_reader :artist, :genre
  @@all = []


  def initialize(name, artist = nil, genre = nil)
    @name = name
      self.artist = artist if artist  #Because artist and genre can be nil or there can be an artist or genre or not.
      self.genre = genre if genre
  end

  def artist=(artist)
    @artist = artist
    artist.add_song(self)
  end

  def genre=(genre)
    @genre = genre
    genre.add_song(self)
  end

  def self.all
    @@all
  end

  def save
    @@all << self
  end

  def self.destroy_all
    all.clear
  end

  def self.create(name)
    created_song = new(name)
      created_song.save
      created_song
  end

  def self.find_by_name(name)
    all.find {|song| song.name == name}
    #binding.pry
  end

  def self.find_or_create_by_name(name)
    find_by_name(name) || create(name)
  end

  def self.new_from_filename(filename)
    song_name = filename.split(' - ')[1]
    song_artist = filename.split('-')[0]
    song_genre = filename.split('-')[2]
    song = Song.new(song_name)
  
  end
end
