require_relative '../lib/concerns/Concerns::Findable.rb'

class Artist
  extend Concerns::Findable 

  attr_accessor :name, :songs

  @@all = []

  def initialize(name)
    @name=name
    @songs =[]
  end

  def self.all
    @@all
  end

  def save
    @@all << self
  end

   def self.destroy_all
    self.all.clear
  end

  def self.create(name)
    artist = Artist.new(name)
    artist.save
    artist
  end

  def add_song(song)
    @songs << song unless self.songs.include?(song)
    song.artist=self unless song.artist == self
  end

  def genres
    @songs.collect {|song| song.genre}.flatten.uniq
  end

end