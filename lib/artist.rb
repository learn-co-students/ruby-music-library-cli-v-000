require "pry"

class Artist

  extend Concerns::Memorable::ClassMethods, Concerns::Findable
  include Concerns::Memorable::InstanceMethods

  attr_accessor :name
  attr_reader :songs

  @@all=[]

  def initialize(name)
    self.name=name
    @songs = []
  end
  def add_song(song)
    song.artist = self unless song.artist == self
    songs << song unless songs.include?(song)
  end
  def genres
    songs.collect {|song| song.genre}.uniq
  end
  def self.all
    @@all
  end

end
