require 'pry'

class Artist
  extend Nameable::ClassMethods
  extend Findable::ClassMethods
  extend Persistable::ClassMethods
  include Persistable::InstanceMethods
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
    song.artist=(self) if !song.artist
    @songs << song if !@songs.include?(song)
  end

  def genres
    self.songs.collect {|song| song.genre}.uniq
  end

end
