require_all 'concerns'

class Artist
  attr_accessor :name
  attr_reader :songs
  extend Concerns::Findable
  include Concerns::Savable
  @@all = []

  def initialize(name)
    @name = name
    @songs = []
  end

  def add_song(song)
    self.songs << song unless self.songs.include?(song)
    song.artist = self unless song.artist == self
  end
  
  def self.all
    @@all 
  end

  def self.create(name)
    artist = self.new(name)
    artist.save
    artist
  end

  def genres
    g = songs.collect {|song| song.genre}
    g.uniq
  end
end



