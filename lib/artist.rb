require 'pry'
require_relative '../config/environment.rb'

class Artist
  attr_accessor :name, :songs, :genres
  extend Concerns::Findable
  extend Persistable::ClassMethods
  include Persistable::InstanceMethods

  @@all = []

  def initialize(name)
    @name = name
    @songs = []
  end

  def genres
    songs.collect{|song| song.genre}.uniq
  end

  def self.all
    @@all
  end

  def self.create(name)
    artist = Artist.new(name)
    self.all << artist
    artist
  end

  def add_song(song)
    songs << song if !songs.include?(song)
    song.artist = self if song.artist != self
  end
end
