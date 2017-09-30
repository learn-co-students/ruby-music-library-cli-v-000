require 'pry'
class Song
  extend Concerns::Findable
  attr_accessor :name, :artist, :genre
  @@all = []

  def initialize(name, artist = nil, genre = nil)
    @name = name
    #self.artist = artist if artist
    artist.add_song(self) if artist != nil
    self.genre = genre if genre
  end

  def self.new_from_filename(filename)
    file_data = filename.split(" - ")
    file_data[2].slice!(".mp3")
    song = self.new(file_data[1])
    song.artist = Artist.find_or_create_by_name(file_data[0])
    song.artist.add_song(song)
    song.genre = Genre.find_or_create_by_name(file_data[2])
    song
  end

  def self.create_from_filename(filename)
    @@all << self.new_from_filename(filename)

  end

  def self.destroy_all
    @@all.clear
  end

  def self.all
    @@all
  end

  def save
    @@all << self
  end

  def self.create(name)
    song = Song.new(name)
    song.save
    song
  end

  def artist=(artist)
    #binding.pry
    @artist = artist
    artist.add_song(self) #if !artist.songs.include?(self)
  end

  def genre=(genre)
    @genre = genre
    genre.songs << self if !genre.songs.include?(self)
  end

  def self.find_by_name(name)
    self.all.detect {|i| i.name == name}
  end

  def self.find_or_create_by_name(name)
    output = nil
    if self.find_by_name(name)
      output = self.find_by_name(name)
    else
      output = self.create(name)
    end
    output
  end



end
