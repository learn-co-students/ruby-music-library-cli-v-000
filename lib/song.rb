require_relative '../lib/concerns/Concerns::Findable.rb'

class Song
  extend Concerns::Findable

  attr_accessor :name, :genre
  attr_reader :artist

  @@all = []
  
  def initialize(name, artist=nil, genre=nil)
    @name=name
      self.artist = artist unless artist == nil
      self.genre = genre unless genre == nil
  end

  def artist=(object)
     @artist = object
     artist.add_song(self)    
  end

  def genre=(object)
     @genre = object
     genre.add_song(self)  
  end


  def self.all
    @@all
  end

  def save
    @@all << self
  end

  def self.destroy_all
    self.all.clear
  end

  def self.create(name)
    song = Song.new(name)
    song.save
    song
  end

  def self.new_from_filename(file_name)
    song_name = file_name.split(" - ")[1]
    song_artist = (file_name.split(" - ")[0])
    song_genre = (file_name.split(" - ")[2].split(".")[0])
    song = Song.new(song_name)
    song.artist_name=(song_artist)
    song.genre_name=(song_genre)
    song
  end

  def genre_name=(name)
    self.genre = Genre.find_or_create_by_name(name)
    genre.add_song(self)
  end

  def artist_name=(name)
    self.artist = Artist.find_or_create_by_name(name)
    artist.add_song(self)
  end

  def self.create_from_filename(file_name)
    song_name = file_name.split(" - ")[1]
    song_artist = (file_name.split(" - ")[0])
    song_genre = (file_name.split(" - ")[2].split(".")[0])
    song = Song.new(song_name)
    song.artist_name=(song_artist)
    song.genre_name=(song_genre)
    @@all << song
    song
  end
end