require_relative '../lib/concerns/memorable'
require_relative '../lib/concerns/findable'

class Artist 

extend Concerns::Findable
extend Memorable::ClassMethods
include Memorable::InstanceMethods

  attr_accessor :name, :songs
  @@all = []
  
  def self.create(name)
    a = self.new(name) 
    a.save
    a
  end
 
  def initialize(name)
    @name = name
    @songs = []
    save
  end
  
  def self.all
    @@all
  end 

  def add_song(song)
    song.artist = self unless song.artist == self
    @songs << song unless self.songs.include?(song)
  end

  def songs
    @songs
  end
  
  def genres 
    @songs.collect{|song| song.genre}.uniq
  end
 end

   