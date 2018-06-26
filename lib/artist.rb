require './config/environment.rb'
require 'pry'
class Artist 
  
  extend Concerns::Findable
  include Concerns::Instance
  
  attr_accessor :name, :songs, :genre
  
  @@all = []
  
  def initialize(name)
    super
    @songs = []
  end
  
  def self.all 
    @@all
  end
  
  def add_song(song)
    Song.find_or_create_by_name(song.name)
    song.artist = self if song.artist == nil
    self.songs << song unless self.songs.any?{|track| track == song}
  end

  def genres
    genre_list = []
    self.songs.each{|song| genre_list << song.genre unless genre_list.any?{|type| type == song.genre}}
    genre_list
  end
  
end