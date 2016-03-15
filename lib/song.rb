require "pry"

class Song
  attr_accessor :name, :artist, :genre

  @@all = []

  def initialize(name, artist = nil, genre = nil)
    @name = name
    self.artist = artist if artist
    self.genre = genre if genre
  end

  def self.all
    @@all
  end

  def save
    self.class.all << self
    self
  end

  def self.destroy_all
    self.all.clear
  end

  def self.create(name, artist = nil, genre = nil)
    song = self.new(name, artist, genre)
    song.save
    song
  end

  def self.find_by_name(name)
    self.all.detect {|s| s.name == name}
  end

  def self.find_or_create_by_name(name, artist = nil, genre = nil)
    self.create(name, artist, genre) unless self.find_by_name(name)
    self.find_by_name(name)
  end

   def self.new_from_filename(filename)
     data = filename.split(" - ")
     name = data[1]
     artist = Artist.find_or_create_by_name(data[0])
     genre = Genre.find_or_create_by_name(data[2].chomp(".mp3"))
     self.new(name, artist, genre)
  end

  def self.create_from_filename(filename)
    self.new_from_filename(filename).save
  end

  #----- w/ Artist -----#
   def artist=(artist)
      @artist = artist if artist != nil
      artist.add_song(self)
    end

  #----- w/ Genre -----#
  def genre=(genre)
    @genre = genre if genre != nil
    genre.songs << self unless genre.songs.include?(self)
  end

end