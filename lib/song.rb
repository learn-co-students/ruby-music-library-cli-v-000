require 'music_module.rb'

class Song
  extend MusicModule::ClassMethods
  include MusicModule::InstanceMethods
  
  attr_accessor :destroy_all, :create, :name, :artist
  
  def initialize(name,artist=nil)
    @name = name
    @artist = artist
    #self.artist = @artist unless @artist == nil
  end
  
  @@all = []

  def self.all
      @@all
  end
  
  def self.destroy_all
    @@all.clear
  end
  
  def save
    @@all << self
  end
  
  def self.create(name)
    song = Song.new(name)
    song.save
    song
  end
  
  #def artist=(artist_instance)
    #binding.pry
   # @artist = artist_instance
    #self.artist = @artist
  #end
end