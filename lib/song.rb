require 'pry'

class Song
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
    @@all.clear
  end

  def self.create(name, artist = nil, genre = nil)
    Song.new(name, artist, genre).tap {|song| song.save}
  end

  def save
    @@all << self
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
    self.all.detect{|s| s.name == name} 
  end

  def self.find_or_create_by_name(name)
    self.find_by_name(name) || self.create(name)
  end

  def self.new_from_filename(name)
    song_array = name.split(" - ")

    artist = Artist.find_or_create_by_name(song_array[0])
    genre = Genre.find_or_create_by_name(song_array[2].gsub(".mp3", ""))

    self.create(song_array[1], artist, genre)
  end

  def self.create_from_filename(name)
    self.new_from_filename(name)
  end

  def self.sort_all
    @@all.each.sort!
  end  

  def to_s
    "#{self.artist.name} - #{self.name} - #{self.genre.name}"
  end
end