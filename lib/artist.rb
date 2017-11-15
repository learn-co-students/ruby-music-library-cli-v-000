require_relative '../config/environment'

class Artist

  extend Concerns::ClassHelper
  extend Concerns::Findable
  include Concerns::InstanceHelper

  attr_accessor :name, :songs

  @@all = []

  def initialize(name)
    @name = name
    @songs = []
  end

  def add_song(song)
    if(!song.artist)
      song.artist = self
    end
    if(!@songs.include?(song))
      @songs << song
    end
  end

  def genres
    @songs.collect { |song| song.genre }.uniq
  end

  def self.all
    @@all
  end

end
