require 'pry'

class Song

  attr_accessor :name
  attr_reader :artist, :genre
  @@all = []

  def initialize(name, artist = nil, genre = nil)
    @name = name
    if artist != nil
      self.artist = artist
    end
    if genre != nil
      self.genre = genre
    end
  end

  def artist=(artist)
    @artist = artist
    artist.add_song(self)
  end

  def genre=(genre)
    @genre = genre
    genre.songs << self unless genre.songs.include?(self)
    #genre.add_song(self)
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

  #Custom Constructor
  def self.create(new_song)
    n = Song.new(new_song)
    n.save
    n
  end
 # binding.pry

  def self.find_by_name(name)
    @@all.detect {|song| song.name == name}
  end

  def self.find_or_create_by_name(name)
    find_by_name(name) || create(name)
  end

  def self.new_from_filename(file_name)
    song_info = file_name.chomp(".mp3").split(" - ")
    new_song = self.find_or_create_by_name(song_info[1])
    new_song.artist = Artist.find_or_create_by_name(song_info[0])
    new_song.genre = Genre.find_or_create_by_name(song_info[2])
    new_song
  end

  def self.create_from_filename(file_name)
    self.new_from_filename(file_name).save
  end
end
