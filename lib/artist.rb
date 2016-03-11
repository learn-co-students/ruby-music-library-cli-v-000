require "pry"
require_relative "../concerns/findable.rb"
require_relative "../concerns/print.rb"

class Artist
  extend Concerns::Findable
  extend Concerns::Print::ClassMethods
  include Concerns::Print::InstanceMethods
  
  attr_accessor :name, :songs
  @@all = []

  #///CLASS METHODS///$
  def initialize(name)
    @name = name
    @songs = []
  end
  def self.create(name)
    artist = Artist.new(name)
    artist.save
    artist
  end
  def self.all
    @@all
  end
  def self.destroy_all
    @@all.clear
  end
  #///INSTANCE METHODS ///#
  def save
    @@all << self
  end

  def add_song(song)
    songs << song if !songs.include?(song)
    song.artist = self if !song.artist
  end

  def genres
    gen = []
    songs.each{ |song| gen << song.genre if song.artist == self}
    gen.uniq

  end


end
