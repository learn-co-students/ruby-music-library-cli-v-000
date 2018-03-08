require 'pry'
require_relative 'concerns.rb'
class Artist
  extend Concerns::Findable
  attr_accessor :name, :songs

  @@all = []




  def self.find_by_name(name)
    @@all.detect{|song| song.name == name}
  end

  def self.find_or_create_by_name(name)
    find_by_name(name) || create(name)
  end

  def self.create(name)
    new = self.new(name)
  end




  def initialize(name)
    @name = name
    @songs = []
  end

  def add_song(song)
    if song.artist == self && !self.songs.include?(song)
      @songs << song
    elsif !song.artist
      song.artist = self
    end
  end

  def genres
    arr = []
    @songs.each do |song|
      if !arr.include?(song.genre)
        arr << song.genre
      end
    end
      arr
  end

  def self.all
    @@all
  end

  def self.destroy_all
    @@all.clear
  end

  def save
    @@all << self
  end

  def self.create(name)
    song = new(name)
    song.save
    song
  end

end
