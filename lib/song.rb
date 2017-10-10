require 'pry'

class Song

  extend Concerns::Findable

  attr_accessor :name, :genre
  attr_reader :artist

  @@all = []

  def initialize(name, artist = nil, genre = nil)
    @name = name
    if artist != nil
      self.artist = artist
    end
    if genre != nil
      self.genre = genre
    end
  end

  def self.all
    @@all
  end

  def self.destroy_all
    self.all.clear
  end

  def save
    @@all << self
  end

  def self.create(name)
    song = self.new(name)
    song.save
    song
  end

  def artist=(artist)
    @artist = artist
    artist.add_song(self)
  end

  def genre=(genre)
    @genre = genre
    if !genre.songs.detect {|s| s == self}
      genre.songs << self
    end
  end

  #def self.find_by_name(name)
    #all.detect {|song| song.name == name}
  #end

  #def self.find_or_create_by_name(name)
    #if self.find_by_name(name)
      #self.find_by_name(name)
    #else
      #create(name)
    #end
  #end

  def self.new_from_filename(file)
    values = file.split(" - ")
    a_name = values[0]
    name = values[1]
    a_genre = values[2].chomp(".mp3")

    song = self.find_or_create_by_name(name)
    song.name = name
    song.artist = Artist.find_or_create_by_name(a_name)
    song.genre = Genre.find_or_create_by_name(a_genre)
    song
  end

  def self.create_from_filename(file)
    new_from_filename(file)
  end

end
