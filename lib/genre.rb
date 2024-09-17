require_relative '../config/environment'

class Genre

  extend Concerns::ClassHelper
  extend Concerns::Findable
  include Concerns::InstanceHelper

  attr_accessor :name, :songs

  @@all = []

  def initialize(name)
    @name = name
    @songs = []
  end

  def artists
    @songs.collect { |song| song.artist }.uniq
  end

  def self.all
    @@all
  end

end
