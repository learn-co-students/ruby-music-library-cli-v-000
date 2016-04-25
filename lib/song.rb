require_relative '../config/environment.rb'

class Song
  extend Concerns::Findable
  extend Concerns::Basics
  include Concerns::FindableInstance
  attr_accessor :name, :artist, :genre

  @@all = []

  def initialize(name, artist=nil, genre=nil)
    @name = name 
    @artist = artist
    artist.nil? ? nil : artist.add_song(self) #if artist is nil, leave nil, else add the self to the artist's list of songs
    @genre = genre
    genre.nil? ? nil : genre.add_song(self) #if genre is nil, leave nil, else add the self to the genre's list of songs
  end

  def self.all
    @@all
  end

  def artist=(artist)
    @artist = artist
    artist.songs.include?(self) ? self : artist.add_song(self) #check if artist's songs already include self; if not, then add 
  end

  def genre=(genre)
    genre.songs.include?(self) ? self : genre.add_song(self) #check if genre's songs already include self; if not, then add 
    @genre = genre
  end

  def self.new_from_filename(file)
    file = file.gsub(".mp3","").split(" - ")  
    song = Song.find_or_create_by_name(file[1])
    genre = Genre.find_or_create_by_name(file[2])
    artist = Artist.find_or_create_by_name(file[0])
    song.artist = artist
    song.genre = genre
    song
  end

  def self.create_from_filename(file)
    song = self.new_from_filename(file)
    song
  end

end







