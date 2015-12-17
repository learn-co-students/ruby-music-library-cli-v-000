require 'pry'
require_relative '../concerns/findable.rb'

class Song
  attr_accessor :name, :genre
  attr_reader :artist
  
  extend Concerns::Findable
  extend Concerns::Creatable
  include Concerns::Savable
  
  def initialize(name, artist=nil, genre=nil)
    @name = name
    self.artist = artist unless artist.nil?
    self.genre = genre unless genre.nil?
  end
  
  @@all = []
  def self.all
    @@all
  end
  
  def self.create(name)
    self.new(name).save
  end
  
  def artist=(artist)
    @artist = artist if self.artist.nil?
    artist.add_song(self) if artist.songs.none? {|song| song == self}
  end
  
  def genre=(genre)
    @genre = genre if self.genre.nil?
    genre.add_song(self) if genre.songs.none? { |s| s == self }
  end
  
  def self.new_from_filename(file_name)
    song_data = file_name.split(".")[0].split("-").map(&:strip)
    
    new_song = self.new(song_data[1])
    # binding.pry
    song_artist = Artist.find_or_create_by_name(song_data[0])
    song_genre = Genre.find_or_create_by_name(song_data[2])
    new_song.artist = song_artist
    new_song.genre = song_genre
    # new_song.genre.add_song(new_song)
    # binding.pry
    
    new_song
  end
  
  def self.create_from_filename(file_name)
    self.new_from_filename(file_name).save
  end
  
end
