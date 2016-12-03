require 'pry'
class Artist

  extend Concerns::Findable

  attr_accessor :name, :songs

  @@all = []

  def initialize(name)
   @name = name
   @songs = []
  end

  def add_song(song)
    #Self means artist instance
  song.artist= self unless song.artist == self
   @songs << song unless @songs.include?(song)
 end


  def self.all
    @@all.uniq
  end

  def self.destroy_all
   @@all.clear
  end

  def save
   @@all << self
  end

  def self.create(name)
   new(name).tap{|x| x.save }
  end

  def genres
    self.songs
  end


end
