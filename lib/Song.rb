require "pry"
class Song

  attr_accessor :name
  attr_reader :artist


  @@all = []

  def artist= (artist)
    @artist = artist
    self.artist.add_song(self)
  end

  def initialize(name, artist=nil)
    self.artist= artist if artist
    @name = name
  end


  def self.all
    @@all
  end

  def self.destroy_all
    @@all.clear
  end

  def save
    self.class.all.push(self)
  end

  def self.create(name)
    song = self.new(name)
    song.save
    song
  end

end
