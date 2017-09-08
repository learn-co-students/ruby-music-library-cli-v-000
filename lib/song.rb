require 'pry'
class Song

  @@all = []

  attr_accessor :name
  attr_reader :artist, :genre

  def initialize(name, *artist_genre)
    @name = name
    self.artist = artist_genre[0] if artist_genre[0]
    self.genre = artist_genre[1] if artist_genre[1]
  end

  def artist=(artist_obj)
    @artist = artist_obj
    artist_obj.add_song(self)
  end

  def genre=(genre_obj)
    @genre = genre_obj
    genre_obj.add_song(self)
  end

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.destroy_all
    self.all.clear
  end


  #----------FIND------------
  extend Concerns::Findable

end
