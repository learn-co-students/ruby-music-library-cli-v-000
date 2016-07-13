require_relative '../concerns/findable.rb'

class Artist
  extend Concerns::Findable
  attr_accessor :name
  @@all = []

  def initialize(name)
    @name= name
    @songs = []
  end

  def self.all
    @@all
  end

  def self.destroy_all
    self.all.clear
  end

  def save
    self.class.all << self
  end

  def self.create(name)
    artist = Artist.new(name)
    artist.save
  end

  def songs
    @songs
  end

  def add_song(song)
    raise AssociationTypeMismatchError, "#{song.class} received, Story expected." if !song.is_a?(Song)
    if @songs.include?(song) == false
      @songs << song
    end
    if song.artist == nil
      song.artist = self
    end
  end

  def genres
    self.songs.collect {|song|song.genre}.uniq
  end

end
