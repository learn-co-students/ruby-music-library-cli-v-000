require_relative '../concerns/findable'

class Artist
  attr_accessor :name, :songs
  
  extend Concerns::Findable
  include Concerns::Savable
  
  def initialize(name)
    @name = name
    @songs = []
  end
  
  def add_song(song)
    self.songs << song if self.songs.none? {|s| s == song}
    song.artist = self if song.artist.nil?
  end
  
  def genres
    self.songs.collect { |song| song.genre }.uniq
  end
  
end