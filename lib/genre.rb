require_relative '../concerns/findable.rb'


class Genre < Basics
  extend Concerns::Findable
  attr_accessor :name, :songs

  def initialize(name)
    @name = name
    @songs = []
  end

  def self.create(name)
   new(name).tap{|genre| genre.save}
  end

  def artists
    self.songs.map { |song| song.artist}.uniq
  end
end
