require 'pry'

class Song

  attr_accessor :name
  attr_reader :artist, :genre
  @@all = []

  def initialize(name, artist=nil, genre=nil)
    @name = name
    self.artist = artist if artist
    self.genre = genre if genre
  end

  def artist=(artist)
    @artist = artist
    artist.add_song(self)
  end

  def genre=(genre)
    @genre = genre
    genre.songs << self unless @genre.songs.include?(self)
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

  def self.find_by_name(name)
    all.detect {|song| song.name == name}   #use double equals!!
  end

  def self.find_or_create_by_name(name)
    find_by_name(name) || create(name)
  end


  def self.new_from_filename(file_name) # I don't understand how this collaborates with #artist_name
    song = Song.new(file_name.split(" - ")[1])
    song.artist = file_name.split(" - ")[0]
    song
  end

end
