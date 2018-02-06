require 'music_module.rb'

class Artist
  extend MusicModule::ClassMethods
  include MusicModule::InstanceMethods
  
  attr_accessor :destroy_all, :create, :name, :songs
  
  @@all = []
  
  def initialize(name)
    @name = name
    @songs = []
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
  
  def self.create(name)
    artist = Artist.new(name)
    artist.save
    artist
  end
  
  def add_song(song)
    song.artist = self if song.artist == nil
    self.songs << song unless @songs.include?(song)
  end

end