
class Song
  extend Concerns::Findable

  attr_accessor :name
  attr_reader :genre, :artist

  @@all = []

  def initialize(name, artist = nil, genre = nil)
    @name = name
    unless artist == nil
      self.artist=(artist)
    end
    unless genre == nil
      self.genre=(genre)
    end
  end

  def artist=(artist)
    @artist = artist
    artist.add_song(self)
  end

  def genre=(genre)
    @genre = genre
    genre.add_song(self)
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
    new_song = self.new(name)
    new_song.save
    new_song
  end

  def self.new_from_filename(filename)
    song = Song.new(filename.split(" - ")[1])
    song.name = filename.split(" - ")[1]
    song.artist = Artist.find_or_create_by_name(filename.split(" - ")[0])
    song.artist.name = filename.split(" - ")[0]
    song.genre = Genre.find_or_create_by_name(filename.split(" - ")[2].gsub(".mp3", ""))
    song.genre.name = filename.split(" - ")[2].gsub(".mp3", "")
    song
  end

  def self.create_from_filename(filename)
    song = self.new_from_filename(filename)
    song.save
  end


end
