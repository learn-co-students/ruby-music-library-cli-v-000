require_relative '../concerns/findable.rb'
require_relative '../concerns/class_actionable.rb'
require_relative '../concerns/instance_actionable.rb'

class Genre
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
    song.genre = self unless song.genre == self
    @songs << song unless @songs.include?(song)
  end

  def artists
    artists = []
    @songs.collect do |song|
      artists << song.artist unless artists.include?(song.artist)
    end
    artists
  end
end
