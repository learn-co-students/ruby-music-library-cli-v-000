require_relative './concerns/findable.rb'
class Song
  extend Concerns::Findable
  attr_accessor :name
  attr_reader :artist, :genre
  @@all = []
  def initialize(name, artist = Artist.new(""), genre = Genre.new(""))
    @name = name
    @artist = artist
    @genre = genre
    artist.add_song(self)
    genre.add_song(self)

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
  def self.destroy_all
    @@all.clear
  end
  def save
    @@all << self
  end
  def self.create(name)
    song = self.new(name)
    song.save
    song
  end
#  def self.find_by_name(name)
#    @@all.detect {|song| song.name == name}
#  end
#  def self.find_or_create_by_name(name)
#    find_by_name(name) || self.create(name)
#  end
  def self.new_from_filename(file_name)
    #Thundercat - For Love I Come - dance.mp3
    artist = Artist.find_or_create_by_name(file_name.split(" - ")[0])
    genre = Genre.find_or_create_by_name(file_name.split(" - ")[2].split(".")[0])
    song = self.new(file_name.split(" - ")[1], artist, genre)

    song
  end
  def self.create_from_filename(file_name)
    song = self.create(file_name.split(" - ")[1])
    song.artist = Artist.find_or_create_by_name(file_name.split(" - ")[0])
    song.genre = Genre.find_or_create_by_name(file_name.split(" - ")[2].split(".")[0])
    song
  end
end
