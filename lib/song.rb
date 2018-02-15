require 'pry'

class Song

  extend Concerns::Findable
  attr_accessor :name
  attr_reader :artist, :genre

  @@all = []

  def initialize(name, artist = nil, genre = nil)
    @name = name
    self.genre = genre
    self.artist = artist
    self.save
  end

  def genre
    @genre
  end

  def genre=(genre)
    if genre != nil
      @genre = genre
      if !genre.songs.include?(self)
        genre.songs << self
      end
    end
  end

  def artist=(artist)
    if artist != nil
    @artist = artist
    artist.add_song(self)
    end
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
    self.new(name)
  end

  def self.new_from_filename(filename)
    artist = Artist.find_or_create_by_name(filename.split(" - ")[0])
    name = filename.split(" - ")[1]
    genre = Genre.find_or_create_by_name(filename.split(" - ")[2].chomp(".mp3"))
    song = self.create(name)
    song.artist = artist
    song.genre = genre
    song
  end

  def self.create_from_filename(filename)
    self.new_from_filename(filename)
  end
end
