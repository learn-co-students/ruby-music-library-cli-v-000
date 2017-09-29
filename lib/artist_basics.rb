require_relative "../concerns/findable_module.rb"
require 'pry'

class Artist
  extend Findable::ClassMethods
  include Findable::InstanceMethods
  extend Concerns::Findable
  
  attr_accessor :name, :songs, :genre
  @@all = []

  def initialize(name)
    @name = name
    @songs = [ ]
    save
  end

  def add_song(song)
    if song.artist != self
      song.artist = self
    end
    if self.songs.include?(song) == false
      @songs << song
      self.genre = song.genre
    end
  end

  def genres
    songs.collect {|i| i.genre}.uniq
  end


  def self.all
    @@all
  end
end