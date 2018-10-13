#require_relative './environment.rb'

class Song
  extend Concerns::Findable
  attr_accessor :name, :artist, :genre, :song
  @@all = []

  def initialize(name, artist = nil, genre = nil)
    @name = name
    @artist = artist
    @genre = genre
    self.artist=(artist) unless @artist == nil
    self.genre=(genre) unless @genre == nil
    save
  end

  def self.all
    @@all
  end

  def self.destroy_all
    self.all.clear
  end

  def save
    @@all << self
  end

  def self.create(name, artist = nil, genre = nil)
    new(name, artist = nil, genre = nil)
  end

  def artist=(artist)
    @artist = artist
    artist.add_song(self)
  end

  def genre=(genre)
    @genre = genre
    genre.songs << self unless genre.songs.include?(self)
  end

#  def self.find_by_name(song)
#    self.all.detect {|s| s.name == song}
#  end

  def self.new_from_filename(filename)
    file = filename.chomp(".mp3").split(" - ")
    song = new(file[1], file[0], file[2])
    song

  end



end
