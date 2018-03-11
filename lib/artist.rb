require 'pry'

class Artist
  extend Concerns::Findable

@@all = []

  attr_accessor :name

  def initialize(name)
    @name = name
    @songs = []
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
    artist = self.all.detect {|art| art.name == name }
    if artist == nil
       artist = Artist.new(name)
       artist.save
     end
    return artist
  end

  def songs
    @songs
  end

  def add_song(song)
        song.artist = self unless song.artist
        self.songs << song unless self.songs.include?(song)
  end

  def genres
    var  = self.songs.collect do |song|
    song.genre
      end
    var.uniq
  end


end
