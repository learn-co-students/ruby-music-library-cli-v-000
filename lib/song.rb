require_relative "./music_module.rb"

class Song
  extend Music::C_Methods
  include Music::I_Methods

  attr_accessor :artist
  
  @@all = []

=begin
  def self.all
    @@all
  end

  def self.destroy_all
      self.all.clear
  end
=end

  def initialize(name, artist = nil)
    super(name)
    @artist = artist if !!artist
  end

end
