require_relative '../concerns/findable.rb'

class Genre
  extend Concerns::Findable
  include Concerns::InstanceMethods
  attr_accessor :name, :songs

  @@all = []

  def initialize(name)
    @name = name
    @songs = []
  end

  def self.all
    @@all
  end

  def self.destroy_all
    self.all.clear
  end

  def song_titles
    self.songs.collect { |song| song.name }
  end

  def artists
    artists = self.songs.collect { |song| song.artist }
    artists.uniq
  end

end