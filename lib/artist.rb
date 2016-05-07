require_relative '../concerns/findable'
require 'pry'

class Artist
  extend Concerns::Findable
  extend Concerns::MaintainableClass
  include Concerns::MaintainableInstance

  @@all = []

  attr_accessor :name, :songs

  def initialize(name)
    @name = name
    @songs = []
  end

  def self.all
    @@all
  end

  def add_song(song_instance)
    if !songs.include?(song_instance) #we may need to check for the artist to be assigned instead of for the song instance itself. wtf does this even mean. grrrrr.
      @songs << song_instance
      song_instance.artist = self
    end
  end

  def genres
    self.songs.collect {|song| song.genre}.uniq
  end

end