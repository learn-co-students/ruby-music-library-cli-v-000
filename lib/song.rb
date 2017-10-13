require 'pry'
class Song
  attr_accessor :name, :artist, :genre
  @@all = []

  def initialize(name, artist = nil, genre = nil)
    @name = name
    self.artist=(artist) if artist != nil
    self.genre=(genre) if genre != nil
  end

  def self.all
    @@all
  end

  def self.destroy_all
    @@all.clear
  end

  def save
    @@all << self
  end

  def self.create(name)
    song = self.new(name)
    song.save
    song
  end

  def artist=(artist)
      @artist = artist
      @artist.add_song(self)
  end

  def genre=(genre)
    @genre=genre
    @genre.songs << self if !@genre.songs.include?(self)
  end

  def self.find_by_name(name)
    @@all.find{|song| song.name == name}
  end

  def self.find_or_create_by_name(name)
    if self.find_by_name(name) != nil
      self.find_by_name(name)
    else
      self.create(name)
    end
  end

  def self.new_from_filename(filename)
    song_data = filename.split(" - ")
    song = self.find_or_create_by_name(song_data[1])
    song.artist = Artist.find_or_create_by_name(song_data[0])
    song.genre = Genre.find_or_create_by_name(song_data[2].chomp(".mp3"))
    song
  end

  def self.create_from_filename(filename)
    song = self.new_from_filename(filename)
    song.save
  end
end
