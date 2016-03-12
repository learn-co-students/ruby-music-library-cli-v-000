require_relative '../lib/concerns/findable.rb'
class Genre
  extend Concerns::Findable
  include Concerns::InstanceMethods
    @@all = []
  attr_accessor :name, :songs
 
    def initialize(name)
    @name = name
    @songs = []
  end

  def add_song(song)
    if !songs.include?(song) 
      @songs << song
      song.genre = self
    end
  end

  def self.all
    @@all
  end

  def artists
    self.songs.collect {|song| song.artist}.uniq
  end
end