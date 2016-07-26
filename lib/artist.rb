require 'pry'

class Artist < Song
  extend Concerns::Findable

  attr_accessor :songs

  def initialize(name)
    super
    @songs = []
  end

  def add_song(song)
    @songs << song unless @songs.include?(song)
    song.artist = self unless song.artist == self
  end

  def genres
    self.songs.collect {|song| song.genre}.uniq
  end

end