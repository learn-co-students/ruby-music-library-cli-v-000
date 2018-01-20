require 'pry'

class Song
  extend Concerns::Findable

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
    artist.add_song(self) #why is this causing an error and being considered "undefined"?
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

  def self.new_from_filename(file_name)
    song = find_or_create_by_name(file_name.split(" - ")[1]) 
    song.artist = Artist.find_or_create_by_name(file_name.split(" - ")[0])
    song.genre = Genre.find_or_create_by_name(file_name.split(" - ")[2].chomp(".mp3"))
    song
  end

  def self.create_from_filename(file_name)
    all << new_from_filename(file_name)
  end

end
