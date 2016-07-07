require 'pry'

class Artist
  
  extend Concerns::ClassMethods
  include Concerns::InstanceMethods
  include Findable
  include Paramable

  attr_accessor :name
  attr_reader :songs

  @@all = []

  def initialize name
    @name  = name
    @songs = []
  end

  def self.all
    @@all
  end

  def save
    self.class.all << self
    self
  end

  def add_song (song)
    @songs << song if !@songs.include?(song)
    song.artist = self if song.artist == nil
  end

  def self.create name
    self.new(name).save
  end

  def add_songs(songs)
    songs.each { |song| add_song(song) }
  end

  def self.destroy_all
    self.all.clear
    self
  end
end
