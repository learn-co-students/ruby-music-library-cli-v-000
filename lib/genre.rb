require_relative "./music_module.rb"

class Genre
  extend Music::C_Methods
  include Music::I_Methods

  @@all = []
  
  def self.all
    @@all
  end
  
  def self.destroy_all
      self.all.clear
  end
  
end