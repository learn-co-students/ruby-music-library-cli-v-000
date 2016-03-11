require "pry"
require_relative "../concerns/findable.rb"
require_relative "../concerns/print.rb"

class Genre
  extend Concerns::Findable
  extend Concerns::Print::ClassMethods
  include Concerns::Print::InstanceMethods
  attr_accessor :name, :songs
  @@all = []

  #///CLASS METHODS///#
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
  def self.create(name)
    genre = Genre.new(name)
    genre.save
    genre
  end
  #///INSTANCE METHODS///#
  def save
    @@all << self
  end
  def artists
    ret = []
    songs.each{|song| ret << song.artist if song.genre == self}
    ret.uniq

    #Song.all.find_all do |song|
      #song.artist if song.genre ==self
    #end
  end
  def add_song(song)
    @songs << song if !songs.include?(song)
  end

end
