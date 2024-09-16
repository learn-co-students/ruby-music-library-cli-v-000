require 'pry'

class Genre

attr_accessor :name, :artist
attr_reader :songs
  extend Concerns::Findable

  @@all = []

  def initialize(name) #Instance_method
    @name = name
    @songs = []

  end

  def artists
    @songs.map(&:artist).uniq
  end

  def self.create(name) #Class method
    name = Genre.new(name)
    name.save
    name
  end

  def self.all #class_method
    @@all
  end

  def self.destroy_all #class_method
    self.all.clear
  end

  def save #Instance_method
    @@all << self
  end

  def songs
    @songs
  end



end
