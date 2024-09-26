require 'pry'
require_relative "../concerns/findable.rb"

class Artist

  extend Concerns::Findable

  attr_accessor :name, :songs
  @@all = []

  def initialize(name)
    @name = name
    @songs = []
    save
  end

  def self.all
    @@all
  end

  def self.destroy_all
    self.all.clear
  end

  def save
    Artist.all << self
  end
  
  def self.create(name)
    Artist.new(name)
  end

  def add_song(song)
    self.songs << song unless songs.include?(song)
    song.artist = self if song.artist.nil?
  end

  def genres
    array  = []
    (self.songs).each {|x| array << x.genre unless array.include?(x.genre)}
    array
  end  

end