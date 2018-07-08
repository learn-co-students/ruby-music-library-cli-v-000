require 'pry'

class Song
  attr_accessor :name, :artist
  @@all = []

  def initialize(name, artist=nil)
    @name = name
    @artist = artist
  end

  def name
    @name
  end

  def self.all
    @@all
  end

  def save
    @@all << self
  end

  def self.destroy_all
    @@all = []
  end

  def self.create(name)
    self.new(name).save
  end

  def artist

  end

  def self.find_by_name(name)

  end

  def self.find_or_create_by_name(name)

  end

end
