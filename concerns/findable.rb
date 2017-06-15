require_relative "../lib/song.rb"
require_relative "../lib/artist.rb"
require_relative "../lib/genre.rb"

require 'pry'
require 'rspec'
require 'require_all'


module Findable
  def initialize(name)
    save
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

  def self.create
    song = Song.new
    song.save
    song
  end
end
