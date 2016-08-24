
require 'pry'
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

  def self.create(name)
    genre = self.new(name)
    #artist.name = name
    genre.save
    genre #why do i need to return this to pass test?
  end

  def artists
    ary = self.songs.collect do |song|
      song.artist
    end
    ary.uniq
  end



end