require_relative "../config/environment.rb"
#require_relative "./music_base.rb"
#require_relative "./Concerns::Findable.rb"

class Artist < Music
  extend Concerns::Findable

  attr_reader :songs

  @@all = []

  def self.all
    @@all
  end

  def initialize(name)
    super
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
