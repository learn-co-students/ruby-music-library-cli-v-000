require_relative '../lib/concerns/findable.rb'


class Artist
  extend Concerns::Findable
  attr_accessor :name
  attr_reader :genre
  @@all = []
  
  def initialize(name)
    @name = name
    @songs = []

  end 
  
  def save
    @@all << self
  end
  
  def self.all 
    @@all
  end 
  
  def self.destroy_all
    # self.@@all.clear doesn't work because...???
    @@all = []
  end 
  
  def self.create(new_artist) 
    n_a = Artist.new(new_artist)
    n_a.save
    n_a
  end 
  
  def songs
    @songs  
  end 
  
  def add_song(song)
    unless @songs.include?(song)
      @songs << song
    end
    
    song.artist ||= self
  end 

  def genres 
    songs.collect{ |s| s.genre }.uniq
  end

end 
  