require_relative "../concerns/findable.rb"

class Song
  extend Concerns::Findable
  attr_accessor :name 
  attr_reader :artist, :genre
  @@all = [] 

  
  def initialize(name, artist=nil, genre=nil) 
    @name = name
    self.artist = artist if artist != nil 
    self.genre = genre if genre != nil
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

  def name_listing
    "#{@artist.name} - #{@name} - #{@genre.name}"
  end

 
  def self.create(name)
    song = self.new(name) 
    song.save
    song 
  end

  def self.new_from_filename(filename)
    data = File.basename(filename, ".*").split(" - ")
    artist, song_name, genre = data[0], data[1], data[2]
    song = self.new(song_name)
    song.artist = Artist.find_or_create_by_name(artist)
    song.genre = Genre.find_or_create_by_name(genre)
    song
  end

  def self.create_from_filename(filename)
    data = File.basename(filename, ".*").split(" - ")
    artist, song_name, genre = data[0], data[1], data[2]
    song = self.create(song_name)
    song.artist = Artist.find_or_create_by_name(artist)
    song.genre = Genre.find_or_create_by_name(genre)
    song
  end

  def self.all
    @@all
  end

  def self.destroy_all
    @@all.clear
  end

end