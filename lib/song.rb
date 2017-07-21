require 'pry'

class Song
  extend Concerns::Findable
  attr_accessor :name
  attr_reader :artist, :genre

  @@all = []

  def initialize(name, artist=nil, genre=nil)
    @name = name
    self.artist=(artist) unless artist == nil
    self.genre=(genre) unless genre == nil
  end

  def artist=(artist)
    @artist = artist
    self.artist.add_song(self) unless self.artist.songs.include?(self)
  end

  def genre=(genre)
    @genre = genre
    self.genre.add_song(self) unless self.genre.songs.include?(self)
  end

  def self.all
    @@all
  end

  def save
    @@all << self
  end

  def self.destroy_all
    @@all.clear
  end

  def self.create(name)
    s = new(name)
    s.save
    s
  end

  def self.new_from_filename(filename)
    file = File.basename(filename)
    artist, song, genre = file.split(" - ")[0], file.split(" - ")[1], file.split(" - ")[2]
    # binding.pry
    self.new(song, artist, genre)
    # song.artist=(artist_name)
    # song.genre=(genre_name)
    # song.artist.add_song(song)
    # song
  end

  def self.create_from_filename(filename)
    
  end

end
