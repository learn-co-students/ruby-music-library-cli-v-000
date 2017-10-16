#require_relative './concerns/findable.rb'

class Song
  extend Concerns::Findable

  attr_accessor :name, :artist, :genre
  @@all = []

  def initialize(name, artist = nil, genre = nil)
    @name = name
    self.artist= artist if artist #rspec wanted initialize to invoke artist=
    self.genre= genre if genre
  end

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.destroy_all
    self.all.clear
  end

  def self.create(new_song_name)
    song = Song.new(new_song_name)
    song.save
    song
  end

  def artist=(artist)
    @artist = artist
    artist.add_song(self)
  end

  def genre=(genre)
    @genre = genre
    genre.add_song(self)
  end

#moving this into module
=begin
  def self.find_by_name(name)
    self.all.detect{|a| a.name == name}
  end

  def self.find_or_create_by_name(name)
    if !self.find_by_name(name)
      self.create(name)
    else
      self.find_by_name(name)
    end
  end
=end

  def self.new_from_filename(file_name)
    name = file_name.split(" - ")[1]
    artist = file_name.split(" - ")[0]
    genre = file_name.split(" - ")[2]
    artist = Artist.find_or_create_by_name(artist)
    genre = Genre.find_or_create_by_name(genre)
    song = Song.find_or_create_by_name(name)
  end

  def self.create_from_filename(file_name)
    self.new_from_filename(file_name).save
  end


end
