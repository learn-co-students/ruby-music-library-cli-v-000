require 'pry'

class Genre #have many songs
  
  extend Concerns::Findable
  
  attr_accessor :name
  attr_reader :songs
  @@all= []

  def initialize(name)
    @name = name
    @songs = []
  end

  def artists
    songs.collect{|song| song.artist}.uniq
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
     genre.save
     genre
   end

end
