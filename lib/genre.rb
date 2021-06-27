require_relative '../concerns/findable'


class Genre 

  extend Concerns::Findable

  attr_accessor :name, :songs, :artists
    @@all=[]
  def initialize(name)
    @name=name
    @songs=[]
  end

  def self.all 
    @@all 
  end

  def self.destroy_all
    self.all.clear
  end

  def save
    @@all<<self
  end

  def self.create(name)
    new_genre=self.new(name)
    new_genre.save
    new_genre
  end

  def artists 
    songs.collect do|song|
      song.artist
    end.uniq
  end

end
