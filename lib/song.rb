require 'pry'
# require_relative '../lib/concerns/findable'

class Song
  extend Concerns::Findable
  attr_accessor :name, :artist, :genre

  @@all=[]

  def initialize(name, artist = nil, genre = nil)
    @name=name
    # self.artist=(artist)
    self.artist = artist if artist
    self.genre = genre if genre

  end

  def save
    @@all << self
  end

  def self.all
    @@all.uniq
  end

  def self.destroy_all
    @@all.clear
  end

  def self.create(name)
    song=Song.new(name)
    song.save
    song
    # binding.pry
  end

  def artist=(artist)
    @artist=artist
    artist.add_song(self)
  end

  def genre=(genre)
    @genre = genre
    if genre.songs.include?(self) == false
      genre.songs << self
    end
  end

  def self.new_from_filename(filename)
    f = filename.gsub(".mp3","").split(" - ")
    songname = f[1]
    artistname = f[0]
    genrename = f[2]
    # binding.pry
    song = Song.create(songname)
    song.artist = Artist.find_or_create_by_name(artistname)
    song.genre = Genre.find_or_create_by_name(genrename)
    song
  end

  def self.create_from_filename(filename)
    song = self.new_from_filename(filename)
    song.save
    song
  end


end
