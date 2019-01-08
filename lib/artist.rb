# 1/8/19  MUST UPDATE from artist-song modules lab
require 'pry'  
class Artist
  attr_accessor :name
  attr_reader :songs

  extend Findable::ClassMethods
  extend Memorable::ClassMethods
  include Memorable::InstanceMethods
  include Paramable::InstanceMethods

  @@all = []

  def initialize
    super # inherit other initialize code from module with same method (Memorable)
    @songs = []
  end

  def self.all
    @@artists
  end

  def add_song(song)
    @songs << song
    song.artist = self
  end

  def add_songs(songs)
    songs.each { |song| add_song(song) }
  end
end
