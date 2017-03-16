# require 'pry'
# require_relative './artist.rb'
# require_relative './genre.rb'
require_relative './concerns/findable.rb'

class Song
  extend Findable

  attr_accessor :name, :artist
  attr_reader :genre
  @@all = []

  def self.all
    @@all
  end

  def self.destroy_all
    @@all = []
  end

  def initialize(name, a = nil, g = nil)
    self.name = name
    self.assign_artist=(a) unless a == nil
    self.genre=(g) unless g == nil
  end

  def self.create(name)
    self.new(name).tap do |song|
      @@all << song
    end
  end

  def save
    @@all << self
  end

  def assign_artist=(a)
    a.add_song(self)
  end

  def genre=(g)
    @genre = g
    g.songs << self unless g.songs.include?(self)
  end

end

# Song.find_or_create_by_name("Happy")
# Song.find_or_create_by_name("Happy")
