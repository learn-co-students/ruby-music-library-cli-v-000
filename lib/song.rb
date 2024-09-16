require 'pry'
class Song
  extend Concerns::Findable
  attr_accessor :name, :artist, :genre

  @@all = []

  def initialize(name, artist = "", genre = "")
    @name = name
    artist.add_song(self) unless artist == ""
    genre.add_song(self) unless genre == ""
  end

  def self.all
    @@all
  end

  def self.destroy_all
    @@all.clear
  end

  def save
    self.class.all << self
  end

  def self.create(name)
    song = self.new(name)
    song.save
    song
  end

  def artist=(artist)
     @artist = artist
     @artist.add_song(self)
     self
   end

   def genre=(genre)
     @genre = genre
     @genre.add_song(self)
     self
   end

   def self.new_from_filename(filename)
     song = self.new(name)
     new_name = filename.split(" - ")
     song.name = new_name[1]
     song.artist = Artist.find_or_create_by_name(new_name[0])
     song.genre = Genre.find_or_create_by_name(new_name[2].gsub!(".mp3", ""))
     song
   end

   def self.create_from_filename(filename)
     song = self.new_from_filename(filename)
     song.save
     song
   end
end
