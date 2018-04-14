require_relative "./music_module.rb"

class Song
  extend Music::C_Methods
  include Music::I_Methods
  
  attr_accessor :artist
  
  @@all = []
  
  def self.all
    @@all
  end
  
  def self.destroy_all
      self.all.clear
  end
  
  def initialize(name, artist = nil)
    super(name)
    @artist = artist if !!artist
  end
  
end