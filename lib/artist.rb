class Artist
  include Concerns::InstanceMethod
  extend Concerns::ClassMethod, Concerns::Findable
  attr_accessor :name, :songs
  attr_reader
  @@all = []
  
  def self.all
    @@all
  end
  
  def initialize(name)
    super
    @songs = []
  end
  
  def add_song(song)
    @songs << song if !@songs.include?(song)
    song.artist = self if song.artist == nil
  end
  
  def genres
    self.songs.map{|song| song.genre}.uniq
  end
end