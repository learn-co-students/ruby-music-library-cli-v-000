require 'pry'

class Song
  attr_accessor :name
  attr_reader :artist, :genre

  @@all = []

  def initialize(name, artist = nil, genre = nil)
    @name = name
    if !artist.nil?
      self.artist = artist
    end
    if !genre.nil?
      self.genre = genre
    end
  end

  def artist=(artist)
    @artist = artist
    artist.add_song(self)
  end

  def genre=(genre)
    @genre = genre
    if !genre.songs.include?(self)
      genre.songs << self
    end
  end

  def self.all
    @@all
  end

  def self.destroy_all
    self.all.clear
  end

  def save
    self.class.all << self
    self
  end

  def self.create(name)
    self.new(name).save
  end

  def self.find_by_name(name)
    self.all.detect{|x| x.name == name}
  end

  def self.find_or_create_by_name(name)
    self.find_by_name(name) || self.create(name)
  end

  def self.new_from_filename(file_name)
    file_name.slice! ".mp3"
    song_details = file_name.split(" - ")
    song = self.new(song_details[1])
    song.artist = Artist.find_or_create_by_name(song_details[0])
    song.genre = Genre.find_or_create_by_name(song_details[2])
    song
  end

  def self.create_from_filename(file_name)
    self.new_from_filename(file_name).save
  end


end
