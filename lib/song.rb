require 'pry'

# a Songs class

class Song
  attr_accessor :name
  attr_reader :artist, :genre

  def initialize(name,artist=nil,genre=nil)
    @name = name
    @artist = artist
    @genre = genre

    if @artist.class == Artist #ensures artist parameter was passed, and a typecheck
      @artist.songs << self
    end

    if @genre.class == Genre #ensures genre parameter was passed, and a typecheck
      @genre.songs << self
    end
  end

  @@all = [] #holds all Song objects

  #a Song has one Artist
  def artist=(artist)
    @artist = artist
    @artist.add_song(self)
  end

  #a Song has one or more genres
  def genre=(genre)
    @genre = genre
    if @genre.songs.include?(self) == false
      @genre.songs << self
    end
  end

  def self.create(name)
    s = Song.new(name)
    s.save
    s
  end

  def self.all
    @@all
  end

  def self.destroy_all
    @@all.clear
  end

  #methods to find a Song by name or create it if it's not found

  def self.find_by_name(name)
    found_song = @@all.detect { |song| song.name == name }
  end

  def self.find_or_create_by_name(name)
    result = @@all.detect { |song| song.name == name }
    if result == nil
      Song.create(name)
    else
      result
    end
  end

  def self.new_from_filename(filename)
    filename = filename.gsub(".mp3","")
    song_data = filename.split(" - ")

    song_name = song_data[1] #song name -- string, not Song object
    genre_name = song_data[2] # genre name -- string, not Genre object
    artist_name = song_data[0] #artist name -- string, not Artist object

    if Song.find_by_name(song_name) == nil #checks to see if Song already exists
      artist = Artist.find_or_create_by_name(artist_name)
      genre = Genre.find_or_create_by_name(genre_name) #create a Genre object
      song = Song.new(song_name,artist,genre) #new song with artist object and genre object params
    end
  end

  def self.create_from_filename(filename)
    filename = filename.gsub(".mp3","")
    song_data = filename.split(" - ")

    song_name = song_data[1] #song name -- string, not Song object
    genre_name = song_data[2] # genre name -- string, not Genre object
    artist_name = song_data[0] #artist name -- string, not Artist object

    song = Song.create(song_name) #new song with artist object and genre object params
    song.artist = Artist.find_or_create_by_name(artist_name)
    song.genre = Genre.find_or_create_by_name(genre_name)
    song
  end

  def save
    @@all << self
  end
end
