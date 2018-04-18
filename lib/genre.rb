require_relative "./music_module.rb"

class Genre
  extend Music::C_Methods
  include Music::I_Methods

  @@all = []

  def initialize(name)
    super(name)
    @songs = []

  end

end
