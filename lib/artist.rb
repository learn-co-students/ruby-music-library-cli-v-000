require_relative 'song.rb'
require_relative '../concerns/findable_module.rb'
class Artist
  attr_accessor :name, :songs
  extend Concerns::Findable
  @@all=[]
  
  def initialize(name)
    @name=name
    @songs=[]
    @@all<<self

  end

  def self.all
    @@all
  end

  def self.destroy_all
    @@all.clear
  end

  def save
    @@all<<self
  end

  def self.create(name)
    self.new(name).save
    self
  end

  def add_song(song)
   if !@songs.include?(song)
    @songs<<song
    song.artist=self
    end
  end

  def genres
    g=@songs.collect do |song|
      song.genre
    end
    g.uniq
  end

end #end class








