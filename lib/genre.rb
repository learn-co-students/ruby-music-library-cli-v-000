require_relative '../config/environment.rb'

class Genre
  extend Concerns::Findable
  extend Concerns::Memorable::ClassMethods
  include Concerns::Memorable::InstanceMethods

  attr_accessor :name, :songs

  @@all = []

  def initialize(name)
    @name = name
    @songs = []
  end

  def self.all
    @@all
  end

  def artists
    songs.collect { |song| song.artist }.uniq
  end

  def add_song(song)
    self.songs << song unless songs.include?(song)
  end
end
