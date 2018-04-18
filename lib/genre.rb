require_relative "./music_module.rb"

class Genre
  extend Music::C_Methods
  include Music::I_Methods

  attr_accessor :songs

  @@all = []

  def initialize(name)
    super(name)
    @songs = []

  end

end
