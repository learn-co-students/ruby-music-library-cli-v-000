require_relative '../concerns/findable.rb'

class Song
  extend Concerns::Findable

  attr_accessor :name, :artist, :genre

  @@all = []

  def initialize(name, artist = nil, genre = nil)
    self.name = name
    self.artist = artist if artist
    self.genre = genre if genre
  end

  def artist=(artist)
    @artist = artist
    artist.add_song(self) unless artist.songs.include?(self)
  end

  def genre=(genre)
    @genre = genre
    genre.add_song(self) unless genre.songs.include?(self)
  end

  def save
    @@all << self
  end

  def self.create(name, artist = nil, genre = nil)
    new_song = Song.new(name, artist, genre)
    new_song.save
    new_song
  end

  def self.destroy_all
    @@all.clear
  end

  def self.all
    @@all
  end

  def print
    puts self.artist.name + ' - ' + self.name + ' - ' + self.genre.name
  end

  def self.print_all
    self.all.each_with_index do |song, index|
      print "#{index + 1}. "
      song.print
    end
  end

  def self.new_from_filename(file_name)
    metadata_array = file_name.split(/ - |\./)
    Song.new(metadata_array[1], Artist.find_or_create_by_name(metadata_array[0]), 
      Genre.find_or_create_by_name(metadata_array[2]))
  end

  def self.create_from_filename(file_name)
    new_song = Song.new_from_filename(file_name)
    new_song.save unless @@all.include?(new_song)
    new_song
  end
end