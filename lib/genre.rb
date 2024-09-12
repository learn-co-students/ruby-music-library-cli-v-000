require_relative '../lib/concerns/memorable.rb'
require_relative '../lib/concerns/findable.rb'

class Genre

  extend Memorable::ClassMethods
  extend Concerns::Findable
  include Memorable::InstanceMethods

  attr_accessor :name, :songs #, :artists

  @@all = []

  def initialize(name)
    self.name = name
    @songs = []
  end

  def self.all
    @@all
  end

  def artists
    temp = []
    @songs.each { |song| temp << song.artist if temp.include?(song.artist) == false }
    temp
  end

end
