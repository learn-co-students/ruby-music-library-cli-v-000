require 'pry'

class Genre
  extend Concerns::Findable
  extend Concerns::Save::ClassMethods
  include Concerns::Save::InstanceMethods
  attr_accessor :name
  attr_reader :songs

  @@all = []

  def initialize(name)
    @name = name
    @songs = []
  end

  def artists
    songs.map { |song| song.artist  }.uniq
  end
end
