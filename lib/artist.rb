require "pry"
class Artist

  attr_accessor :name
  attr_reader :songs
  extend Findable::ClassMethods
  include Findable::InstanceMethods
  @@all=[]

  def initialize(name)
    self.name=name
    @songs = []
    self.save
  end
  def add_song(song)
    songs << song if !songs.include?(song)
    song.artist = self if !song.artist==self
  end
  def self.all
    @@all
  end

end
