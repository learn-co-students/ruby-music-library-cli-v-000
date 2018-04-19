require_relative "./music_module.rb"
require_relative "./Concerns::Findable.rb"

class Artist
  extend Music::C_Methods, Concerns::Findable
  include Music::I_Methods

  attr_reader :songs

  @@all = []

  def initialize(name)
    super(name)
    @songs = []
  end

  def add_song(song)
    song.artist = self if !!!song.artist

    if songs.include?(song)
      return nil
    end

    @songs << song
  end

  def genres
    ret = songs.collect { |e| e.genre}
    ret = ret.uniq
    ret
  end
end
