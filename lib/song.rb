require 'music_module.rb'

class Song
  extend MusicModule::ClassMethods
  include MusicModule::InstanceMethods
  
  attr_accessor :destroy_all, :create, :name
  
  def initialize(name)
    @name = name
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
end