require_relative '../concerns/findable.rb'
require_relative '../concerns/class_actionable.rb'
require_relative '../concerns/instance_actionable.rb'

class Artist
  extend Concerns::Findable
  extend Concerns::ClassActionable
  include Concerns::InstanceActionable

  attr_accessor :name

  @@all = []

  def self.all
    @@all
  end

  def initialize(name)
    self.name = name
    @songs = []
  end

  def add_song(song)
    song.artist = self unless song.artist == self
    @songs << song unless @songs.include?(song)
  end

  def genres
    genres = []
    @songs.collect do |song|
      genres << song.genre unless genres.include?(song.genre)
    end
    genres
  end
end