require 'pry'

class Song
  attr_accessor :name
  attr_reader :artist, :genre

  def initialize(name, artist = nil, genre = nil)
    @name = name
    self.artist = artist if artist 
    self.genre = genre if genre
  end

  @@all = []

  def self.all 
    @@all
  end

  def genre=(genre)
    @genre = genre
    genre.songs << self unless genre.songs.include?(self)
  end

  def self.destroy_all 
    @@all.clear
  end

  def save
    @@all << self
  end

  def self.create(name)
    Song.new(name).tap {|song| song.save }
  end
  
  def artist=(artist)
    @artist = artist
    artist.add_song(self)
  end

  def self.find_by_name(name)
    self.all.find{ |s| s.name == name }
  end
  
  def self.find_or_create_by_name(name)
    find_by_name(name) || create(name)
  end
  
  def self.new_from_filename(filename)
    file_split = filename.split(" - ")
    s_name = file_split[1]
    artist = Artist.find_or_create_by_name(file_split[0])
    genre = Genre.find_or_create_by_name(file_split[2].gsub(".mp3",""))

    song = Song.new(s_name, artist, genre)
    song
  end

  def self.create_from_filename(filename)
    self.new_from_filename(filename).tap {|song| song.save}
  end
end
