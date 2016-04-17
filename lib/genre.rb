require_relative '../concerns/findable.rb'

class Genre
  extend Concerns::Findable
  attr_accessor :name, :songs
  @@all = []
  def initialize(name)
    @name = name
    @songs = []
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
  def self.create(genre)
    new_genre = Genre.new(genre)
    new_genre.save
    new_genre
  end
  def add_song(song)
    song.genre = self unless song.genre == self
    @songs << song unless @songs.include?(song)
  end
  def artists
    @songs.collect do |song|
      song.artist
    end.uniq
  end
end
