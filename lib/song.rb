require 'pry'

class Song
  extend Concerns::Findable
  attr_accessor :name, :artist, :genre

  def initialize(name, artist = nil, genre = nil)
    @name = name
    if artist != nil
      self.artist = artist
    end
    if genre != nil
      self.genre = genre
    end
  end

  @@all = []

  def self.all
    @@all
  end

  def self.destroy_all
    self.all.clear
  end

  def save
    self.class.all << self
  end

  def self.create(name, artist = nil, genre = nil)
    new_song = Song.new(name, artist, genre)
    @@all << new_song
    new_song
  end
  #make a way for me to make a new artist if it doesn't already exist
  def artist=(artist)
    @artist = artist
    artist.add_song(self)
  end

  def genre=(genre)
    @genre = genre
    genre.songs << self unless genre.songs.include?(self)
  end

  def self.find_by_name(name)
   self.all.detect {|object| object.name == name}
  end

  def self.find_or_create_by_name(name)
   if self.all.detect {|object| object.name == name}
      self.all.detect {|object| object.name}
    else
      self.create(name)
   end
  end

  def self.new_from_filename(file_name)
    song_data = file_name.split(" - ")
    artist_name = song_data[0]
    song_name = song_data[1]
    genre_name = song_data[2].chomp(".mp3")
    artist = Artist.find_or_create_by_name(artist_name)
    genre = Genre.find_or_create_by_name(genre_name)
    self.create(song_name, artist, genre)
  end

  def self.create_from_filename(file_name)
    new_song = self.new_from_filename(file_name)
  end

end











