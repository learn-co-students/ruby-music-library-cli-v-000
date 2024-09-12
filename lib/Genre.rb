require 'pry'

class Genre
  include Memorable::InstanceMethods
  extend Memorable::ClassMethods
  extend Concerns::Findable

  attr_accessor :name, :songs
  @@all = []

  def initialize(name)
    @name = name
    @songs = []
  end

  def self.all
    @@all
  end

  def save
    @@all << self
  end

  def artists
    @songs.map {|song| song.artist}.uniq
  end

  # def self.create(name)
  #   new(name).tap {|x| x.save}
  # end

end
