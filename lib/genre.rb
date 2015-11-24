require 'pry'
require_relative "../concerns/findable.rb"

class Genre

  extend Concerns::Findable

  attr_accessor :name, :songs, :artists
  @@all = []

  def initialize(name)
    @name = name
    @songs = []
    @artist = []
    save
  end

  def self.all
    @@all
  end

  def self.destroy_all
    self.all.clear
  end

  def save
    Genre.all << self
  end

  def self.create(name)
    Genre.new(name)
  end

  def add_song(song)
    self.songs << song unless @songs.include?(song)
    self.artist << song.artist unless @songs.include?(song)
    song.genre = self if song.genre.nil?
  end

  def artists
    array = []
    self.songs.each {|x| array << x.artist unless array.include?(x.artist)}
    array
  end



end