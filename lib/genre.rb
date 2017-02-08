require 'pry'
class Genre
  attr_accessor :name, :genre, :songs
    extend Concerns::Findable
  @@all = []

  def initialize(name)
    @name = name
    @songs = []
    @@all << self

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
    self.new(genre)
   end

   def artists
    @songs.collect{|song| song.artist}.uniq
   end

end
#binding.pry
