require 'pry'
require_relative '../concerns/findable.rb'

class Song
  attr_accessor :name
  
  extend Concerns::Findable
  include Savable
  
  # @@all = []
  
  # def self.all
  #   @@all
  # end
  
  def initialize(name)
    @name = name
  end
  
  def create(name)
    new_song = Song.new(name)
    new_song.save
    
  end
  
  # def save
  #   self.class.all << self
  # end
  
end

song = Song.create("In an Aeroplane Over the Sea")

binding.pry