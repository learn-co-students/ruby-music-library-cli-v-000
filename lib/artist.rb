require_relative "./music_module.rb"

class Artist
  extend Music::C_Methods
  include Music::I_Methods

  attr_reader :songs

  @@all = []

  def self.all
    @@all
  end

  def self.destroy_all
      self.all.clear
  end

  def self.add_song(song)
    @songs << song

    if songs.include?(song)
      return nil
    end

    song.artist = self if !!!song.artist
  end

  def initialize(name)
    super(name)
    @songs = []
  end
end
