require 'pry'
#require_relative './artist.rb'
#require_relative './song.rb'
#require_relative './music_importer.rb'
#require_relative './concerns/findable.rb'

class Genre
  extend Concerns::Findable
  
  attr_accessor :name
  attr_reader :songs
  
  @@all = []
  
  def initialize(name)
    @name = name
    @songs = []
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
    genre = self.new(name)
    genre.save
    genre
  end
  
  def artists
    self.songs.collect {|song| song.artist}.uniq
  end
  

end