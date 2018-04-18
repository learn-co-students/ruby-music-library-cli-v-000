require_relative "./music_module.rb"

class Genre
  extend Music::C_Methods
  include Music::I_Methods

  attr_reader :songs

  @@all = []

  def initialize(name)
    super(name)
    @songs = []
  end

  def add_song(song)
    @songs << song
  end

end
