require './config/environment.rb'
require 'pry'
class Genre 
 
  extend Concerns::Findable
  include Concerns::Instance
 
  attr_accessor :name, :genre, :songs
 
  @@all = []

  def initialize(name)
    super
    @songs = []
  end

  def self.all 
    @@all
  end
  
  def artists
    artist_list = []
    self.songs.each{|song| artist_list << song.artist unless artist_list.any?{|singer| singer == song.artist}}
    artist_list
  end
end