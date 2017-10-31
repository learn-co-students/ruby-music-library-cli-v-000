require 'pry'
class Song
  extend Findable
  attr_accessor :name
  attr_reader :artist, :genre
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
    @@all.clear
  end

  def save
    @@all << self
  end

  def self.create(created_song)
    created_song = Song.new(created_song)
    created_song.save
    created_song
  end

  def artist=(artist)
    @artist = artist
    artist.add_song(self)
  end

  def genre=(genre)
    @genre = genre
    genre.add_song(self)
  end

<<<<<<< HEAD
  # def self.find_by_name(name)
  #   #.detect => return the first element in the array that returns true
  #   self.all.detect{|o| o.name == name}
  # end

  def self.find_or_create_by_name(name)
    self.find_by_name(name) ? self.find_by_name(name) : self.create(name)
=======
  def self.find_by_name(name)
    #.detect => return the first element in the array that returns true
    self.all.detect{|o| o.name == name}
  end

  def self.find_or_create_by_name(name)

    if self.find_by_name(name)
      binding.pry
      self.find_by_name(name)
    else
      binding.pry
      self.new(name)
    end
>>>>>>> 3d8b41c006abba6032a0ddaf0cdea182cc9f60b5
  end

end
