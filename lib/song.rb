require 'pry'

class Song
  extend Concerns::Findable
  
  attr_accessor :name
  attr_reader :artist, :genre
  @@all = []
 
  def initialize(name, artist = nil, genre = nil)
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
    @@all << self
  end

  def self.create(name)
    new_song = Song.new(name)
    new_song.save
    new_song
  end

  def artist=(artist)
    @artist = artist
    artist.add_song(self)
  end

  def genre=(genre)
    @genre = genre
    genre.songs << self unless genre.songs.include?(self)
  end

  def self.new_from_filename(name)
    split_name = name.split(" - ")
    split_name[2].slice!(".mp3")
    artist = split_name[0]
    title = split_name[1]
    genre = split_name[2]

    artist_obj = Artist.find_or_create_by_name(artist)
    genre_obj = Genre.find_or_create_by_name(genre)

    self.new(title, artist_obj, genre_obj)
  end

  def self.create_from_filename(name)
    self.new_from_filename(name).save
  end
end