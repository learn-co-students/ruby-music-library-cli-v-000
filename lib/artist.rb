require_relative '../lib/concerns/findable.rb'
require 'pry'

class Artist
  extend Concerns::Findable
  include Concerns::InstanceMethods

  @@all = []

  attr_accessor :name, :songs

  def initialize(name)
    @name = name
    @songs = []
  end

  def self.all
    @@all
  end

  def add_song(song)
    if !songs.include?(song)
      @songs << song
      song.artist = self
    end
  end

  def genres
    self.songs.collect {|song| song.genre}.uniq
  end

end