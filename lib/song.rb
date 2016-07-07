require 'pry'

class Song
  extend Concerns::ClassMethods
  include Concerns::InstanceMethods
  attr_accessor :name
  attr_reader :artist

  @@all = []

  def initialize (name, artist = nil)
    @name = name
    self.artist
  end

  def artist=(artist)
    @artist = artist
    artist.songs << self if !artist.songs.include?(self)
  end

  def self.all
    @@all
  end

  def save
    self.class.all << self
    self
  end

  def self.create name
    self.new(name).save
  end

  def self.destroy_all
    self.all.clear
  end

end


