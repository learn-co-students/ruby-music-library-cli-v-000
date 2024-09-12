require_relative "../concerns/Findable.rb"

class Artist
  extend Concerns::Findable


  attr_accessor :name
  @@all = []

  def initialize(name)
    @name = name
    @songs = []


  end
  def songs
    @songs
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

  def add_song(song)
    @song = song
    unless @songs.include?(@song)
      @songs << @song
    end
    unless @song.artist == self
      @song.artist = self
    end
  end

  def genres
    list = []
    self.songs.collect do |song|
      list << song.genre
    end
    list.uniq

  end




  def self.create(name)
    artist = Artist.new(name)
    artist.save
    return artist
  end



end
