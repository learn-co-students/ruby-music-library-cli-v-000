require 'pry'

class Song
  extend Concerns::Findable
  attr_accessor :name, :artist, :genre, :artist_name

  @@all = []

  def initialize(name, artist = nil, genre = nil)
    @name = name
    @artist = artist
    @genre = genre
    artist.add_song(self) if artist != nil 
    genre.add_song(self) if genre != nil 
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

  def artist=(artist)
    @artist = artist
    artist.add_song(self)
  end

  def genre=(genre)
    @genre = genre
    genre.add_song(self)
  end

  def name=(name)
    @name = name
  end

  def self.create(name, artist = nil, genre = nil)
    song = self.new(name, artist = nil, genre = nil)
    song.save
    song
  end

  def self.new_from_filename(file_name)
    data = file_name.chomp(".mp3").split(" - ")
    artist = Artist.find_or_create_by_name(data[0])
    genre = Genre.find_or_create_by_name(data[2])
    self.new(data[1], artist, genre)
  end

  def self.create_from_filename(file_name)
    Song.new_from_filename(file_name).tap {|song| song.save}
  end

end

