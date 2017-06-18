require 'pry'
class Artist

  attr_accessor :name
  @@all = []

  def initialize(name)
    @name = name
    @songs = []
  end

  def self.all # candidate for module
    @@all
  end

  def self.destroy_all # candidate for module
    @@all.clear
  end

  def save # candidate for module
    self.class.all << self
  end


    def self.create(name)
      artist = Artist.new(name)
      artist.save
      artist
    end

    def songs
      @songs
    end

end
