require 'bundler'
require 'pry'
Bundler.require

module Concerns
end

require_all 'lib'


class Song
  attr_accessor :name
  
  @@all = []

  def initialize(name)
    @name = name
  end

  def self.all
    @@all 
  end

  def self.destroy_all
    @@all.clear
  end

  def save
    @@all << self
  end

  def self.create(string)
    song = self.new(string)
    song.save
  end






end

