require 'pry'
class Song
  extend Concerns::Findable
  attr_accessor :name, :artist, :genre

  @@all = []

  def initialize(name, artist = nil, genre = nil)
    @name = name
    self.artist = artist if artist
    self.genre = genre if genre
  end

  def self.all
    @@all
  end

  def self.destroy_all
    self.all.clear
  end

  def save
    self.class.all << self
  end

  def self.create(song)
    new_song = self.new(song)
    new_song.save
    new_song
  end

  def artist=(artist)
    @artist = artist
    artist.add_song(self)
  end

  def genre=(genre)
    @genre = genre
    genre.songs << self unless genre.songs.include?(self)
  end

  def self.find_by_name(name)
    self.all.detect{|song| song.name == name}
  end

  def self.find_or_create_by_name(name)
    self.find_by_name(name) == nil ? self.create(name) : self.find_by_name(name)
  end

  def self.new_from_filename(file_name)
      na = Artist.find_or_create_by_name(file_name.split(" - ")[0])
      ng = Genre.find_or_create_by_name(file_name.split(" - ")[2].split(".")[0])
      Song.new(file_name.split(" - ")[1], na, ng)
  end

  def self.create_from_filename(file_name)
    if file_name.is_a?(Array)
      file_name.each do |x|
        self.new_from_filename(file_name).save
        self.all
      end
    else
      self.new_from_filename(file_name).save
      self.all[0]
    end
  end
end
