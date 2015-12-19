# require_relative 'concerns/findable.rb'
require_relative 'artist.rb'

class Song
  # extend Concerns::Findable
  attr_accessor :name, :artist
  @@all = []

  def initialize(name)
    @name = name
    # @artist = artist
  end

  def self.all
    @@all
  end

  def self.destroy_all
    self.all.clear
  end

  def save
    @@all << self
  end

  def self.create(name)
    created = self.new(name)
    created.save
    created
  end

  def artist=(artist)
    # Artist.new(artist).add_song(self) if 
    artist.songs << self if !artist.songs.include?(self)
    # artist.add_song(self)
    @artist = artist
  end
end