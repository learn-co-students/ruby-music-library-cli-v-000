require_relative '../lib/concerns/findable.rb'

class Song
  extend Concerns::Findable
  attr_accessor :name, :artist, :genre

  @@all =[]

  def initialize(name, artist = nil, genre = nil)
    @name = name
    self.artist=(artist) if artist
    self.genre=(genre) if genre
  end

  def self.all
    @@all
  end

  def self.create(name)
    song = Song.new(name)
    @@all << song.save
  end

  def save
    @@all << self
  end

  def self.destroy_all
    all.clear
  end

  def artist=(artist)
    @artist = artist
    artist.add_song(self)
  end

  def genre=(genre)
    @genre = genre
    genre.songs << self unless genre.songs.include?(self)
  end

  def self.find_by_name(name)
    @@all.find {|song| song.name == name}
  end

  def self.find_or_create_by_name(name)
    self.all.each do |artist|
      if artist.name == name
        else
        artist = Artist.new(name)
      end
      return artist
    end
  end

  def self.new_from_filename(filename)
    filename = filename.split(" - ")
    name = filename[1]
    artist = filename[0]
    genre = filename[2].split(".")[0]
    Song.new(name, artist, genre)
  end

  def self.create_from_filename(filename)
    self.new_from_filename(filename).save
  end
end

