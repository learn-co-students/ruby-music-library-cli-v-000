require_relative 'concerns/findable.rb'

class Genre
  extend Concerns::Findable
  include Concerns::Findable

  @@all = []

  attr_accessor :name
  attr_reader :artists, :songs

  def initialize(name)
    @songs = []
    @name = name
    save
  end

  def artists
    songs.collect{|s| s.artist}.uniq
  end

  def self.all
    @@all
  end

end