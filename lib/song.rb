require 'pry'
class Song
  extend Concerns::Findable

  attr_accessor :name, :artist

  @@all = []

  def self.all
    @@all
  end

  def self.destroy_all # Song.destroy_all
    self.all.clear
  end

  def save
    @@all << self
  end

  def self.create(name)
    Song.new(name).tap {|song| song.save}
  end

  def songs
    @song
  end

  def initialize(name)
    @name = name

  end
end
