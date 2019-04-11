require 'pry'

class Artist
  extend Group::ClassMethods
  include Group::InstanceMethods
  extend Concerns::Findable

  attr_accessor :name, :all, :songs

  @@all = []

  def initialize(name)
    @name = name
    @@all << self
    @songs = []
  end

  def create(name)
    initialize(name)
  end

  def self.all
    @@all
  end

  def add_song(song)
    # binding.pry
    if song.artist == nil
      song.artist = self
    end

    if !songs.include?(song)
      @songs << song
    end
  end

  def genres
    self.songs.collect{|song| song.genre}.uniq

  end


end
