require 'pry'

class Song
  extend Concerns::ClassMethods
  include Concerns::InstanceMethods
  attr_accessor :name
  attr_reader :artist

  @@all = []

  def initialize (name, artist_name = nil)
    @name = name

    self.artist = artist_name if !(artist_name == nil)
  end

  def artist=(artist)
    artist.add_song(self)
    @artist = artist
  end

  def name_artist=(artist)
    @artist = artist
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


