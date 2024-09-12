require_relative './concerns/findable.rb'
require 'pry'
class Song
  extend Concerns::Findable
  
  @@songs = []
  
  attr_accessor :name, :artist, :genre

  def initialize(name,artist=nil,genre = nil)
    @name = name
    self.artist = artist if artist != nil
    self.genre = genre if genre!=nil
  end

  def self.all
    @@songs
  end

  def self.create(name)
    song = Song.new(name)
    song.save
    self.all.last
  end

  def save
    Song.all << self
  end

  def self.destroy_all
    self.all.clear
  end

  def artist=(artist)
    @artist = artist
    if artist.songs.include?(self) == false  
      artist.add_song(self)
    end 
  end

  def genre=(genre)
    @genre = genre
    if genre.songs.include?(self) == false
      genre.songs << self
    end 
  end

  def self.new_from_filename(filename)
    data = filename.split(" - ")
    data[2] = data[2][0..data[2].length-5]
    song = Song.find_or_create_by_name(data[1])
    artist = Artist.find_or_create_by_name(data[0])
    genre = Genre.find_or_create_by_name(data[2])

    song.artist = artist
    song.genre = genre
    song
  end

  def self.create_from_filename(filename)
    new_from_filename(filename)
  end

end