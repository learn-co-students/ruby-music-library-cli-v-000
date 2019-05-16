require "pry"
require_relative "../config/environment"

class Song

  # include Concerns::Findable::InstanceMethods
  extend Concerns::Findable

  attr_accessor :name
  attr_reader :artist, :genre

  @@all = []

  def initialize(name, artist=nil, genre=nil)
    @name = name
    self.artist = artist unless artist == nil
    self.genre = genre unless genre == nil
  end

  def artist=(artist)
    @artist = artist
    artist.add_song(self)
  end

  def genre=(genre)
    @genre = genre
    genre.songs << self unless genre.songs.include?(self)
  end

  def self.all
    @@all
  end

  def self.destroy_all
    @@all.clear
  end

  def save
    self.class.all << self
  end

  def self.create(name)
    song = self.new(name)
    song.save
    song
  end

  # def self.find_by_name(name)
  #   self.all.detect { |song| song.name == name  }
  # end
  #
  # def self.find_or_create_by_name(name)
  #   self.find_by_name(name) ? self.find_by_name(name) : self.create(name)
  # end

  # ******** uniq methods ********

  def self.new_from_filename(file)
    song_info = file.split(" - ")
    new_song = Song.new(song_info[1])
    new_song.artist = Artist.find_or_create_by_name(song_info[0])
    new_song.genre = Genre.find_or_create_by_name(song_info[2].gsub(".mp3", ""))
    new_song
  end

  def self.create_from_filename(file)
    new_song = self.new_from_filename(file)
    new_song.save
  end

  def import
    
  end

end
