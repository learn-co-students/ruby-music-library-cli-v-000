require 'pry'

class Artist
  include Memorable::InstanceMethods
  extend Memorable::ClassMethods
  extend Concerns::Findable

  attr_accessor :name, :songs
  @@all = []

  def initialize(name)
    @name = name
    @songs = []
  end

  def self.all
    @@all
  end

  def add_song(song)
    song.artist = self unless song.artist == self
    @songs << song unless @songs.include?(song)
  end

  def genres
    @songs.map {|song| song.genre}.uniq
  end

end
