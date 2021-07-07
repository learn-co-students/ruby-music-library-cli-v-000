# this is here because artist.rb is loading before Concerns::Findable module
# require_relative './concerns/findable.rb'

class Artist
  extend Concerns::Findable
  attr_accessor :name, :songs
  attr_reader :genre
  @@all = []
  
  def initialize(name)
    @name = name
    @songs = []

  end 

  def self.create(new_artist_name) 
    # n_a = Artist.new(new_artist)
    # n_a.save
    # n_a
##### BETTER TO WRITE AS \/
    new(new_artist_name).tap{|a| a.save}
  end 
  
  def self.all 
    @@all
  end 
  
  def self.destroy_all
    # self.@@all.clear doesn't work because...???
    @@all = []
  end 
  
  def save
    @@all << self
  end

  def songs
    @songs  
  end 
  
  def add_song(song)
    # song.artist = self unless song.artist == self
    @songs << song unless @songs.include?(song)
    song.artist ||= self
  end 

  def genres 
    songs.collect{|s| s.genre }.uniq
  end

end