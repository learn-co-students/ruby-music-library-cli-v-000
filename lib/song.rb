require 'pry'

class Song
  attr_accessor :name, :artist, :genre
    @@all = []

  def initialize(name, artist = nil, genre = nil)
    @name = name
    self.artist = artist if artist
    self.genre = genre if genre
  end

  def self.create(name)
    song = Song.new(name)
    song.save
    song
  end

  def artist=(artist)
    @artist = artist
    artist.add_song(self)
  end

  def genre=(genre)
    @genre = genre
    genre.songs << self unless genre.songs.include?(self)
  end

# @@all: methods to read, save & delete @@all Song objects
  def self.all
    @@all
  end

  def save
    @@all << self
    @@all.uniq!
    self
  end

  def self.destroy_all
    @@all.clear
  end
# end @@all methods

  def self.find_by_name(name)
    self.all.find {|song| song if song.name == name}
  end

  def self.find_or_create_by_name(name)
    self.find_by_name(name) || self.create(name)
  end

# .new_from_filename
# initializes new Song with filename arg
#    if Song not already exist
# creates new artist & genre, if they don't exist, from filename arg
# adds artist & genre as this song's properties
  def self.new_from_filename(filename)
    parts = (filename.gsub(".mp3","").split(" - "))
    song = self.new(parts[1])
    song.artist = Artist.find_or_create_by_name(parts[0])
    song.genre = Genre.find_or_create_by_name(parts[2])
    song.save
  end

# .create_from_filename
# when MusicImporter runs it imports files
# creates new song from each filename
# with song's associated artist & genre
  def self.create_from_filename(filename)
    song = self.new_from_filename(filename).save
  end


end # Song class end
