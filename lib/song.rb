require 'pry'

class Song
  # extend Findable::ClassMethods
  # include Paramable::InstanceMethods

  attr_accessor :name, :artist, :genre

  def initialize(name, artist = nil, genre = nil)
    @name = name
    self.artist = artist if artist
    self.genre = genre if genre
  end

  def self.create(name)
    Song.new(name).save
    self
  end

  def artist=(artist)
    @artist = artist
    artist.add_song(self)
  end

  def genre=(genre)
    @genre = genre
    genre.songs << self # if !genre.songs.include?(self)
    genre.songs.uniq!
  end

  def genre
    @genre
  end

    # @@all array: methods to save,
    # read & delete list of all Song objects
  @@all = []

  def self.all
    @@all
  end

  def save
    @@all << self
  end

  def self.destroy_all
    @@all.clear
  end
    # end @@all methods

end # Song class end
