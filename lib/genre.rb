require 'pry'

class Genre
  attr_accessor :name, :songs

  @@all = []

  include Memorable::InstanceMethods
  extend Memorable::ClassMethods
  extend Concerns::Findable

  def self.all
    @@all
  end

  def initialize(name)
    @name = name
    @songs = []
  end

  def self.create(name)
    new_instance = self.new(name)
    new_instance.save
    new_instance
  end

  def artists
    artists = []
    all_artists = self.songs.collect {|song| song.artist}
    all_artists.each {|artist| artists << artist unless artists.include?(artist)}
    artists
  end

end
