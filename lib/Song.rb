require 'pry'

class Song

  extend Concerns::Findable

  attr_accessor :name, :artist, :genre
  @@all = []

  def initialize(name, artist=nil, genre=nil)
    @name = name
    @artist = artist
    @genre = genre
    if genre!=nil
      self.genre.songs << self unless self.genre.songs.include?(self)
    end
    if artist!=nil
      self.artist.add_song(self)
    end
    #self.artist.songs << self
  end

  def artist=(artist)
    @artist = artist
    artist.add_song(self)
  end

  def self.all
    @@all
  end

  def self.destroy_all
    self.all.clear
  end

  def save
    @@all << self
    self
  end

  def self.create(input)
    song = Song.new(input)
    song.save
    song
  end

  def genre=(genre)
    @genre = genre
    self.genre.songs << self unless self.genre.songs.include?(self)
  end

  def self.new_from_filename(filename)
    filename = filename.split(" - ")
    artist = filename[0]
    song = filename[1]
    genre = filename[2].split(".")[0]
    bla = self.new(song)
    #binding.pry
    bla.genre = Genre.find_or_create_by_name(genre)
    bla.artist = Artist.find_or_create_by_name(artist)
    bla
  end

    def self.create_from_filename(filename)
          new_from_filename(filename).save
    end

end