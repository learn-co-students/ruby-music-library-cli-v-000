require 'pry'
require_relative '../concerns/findable.rb'

class Song
  attr_accessor :name, :genre
  attr_reader :artist
  
  extend Concerns::Findable
  include Concerns::Savable
  
  def initialize(name, artist=nil, genre=nil)
    @name = name
    self.artist = artist unless artist.nil?
    self.genre = genre unless genre.nil?
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
    new_song.artist = Artist.find_or_create_by_name(song_data[0])
    new_song.genre = Genre.find_or_create_by_name(song_data[2])
    # new_song.artist.add_song(new_song)
    
    new_song
  end

  
end
