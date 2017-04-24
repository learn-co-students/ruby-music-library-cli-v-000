require "pry"
class Artist

  attr_accessor :name
  attr_reader :songs
  extend Concerns::Memorable::ClassMethods, Concerns::Findable
  include Concerns::Memorable::InstanceMethods
  @@all=[]

  def initialize(name)
    self.name=name
    @songs = []
  end
  def add_song(song)
    songs << song if !songs.include?(song)
    song.artist = self if !song.artist
  end
  def genres
    songs.collect {|song| song.genre}.uniq
  end
  def self.all
    @@all
  end

end
