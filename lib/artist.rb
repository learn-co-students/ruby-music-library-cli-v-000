


class Artist

  extend Concerns::Findable

  attr_accessor :name

  @@all = []

  def initialize(name)
    @name = name
    @songs = []
  end

  def self.all
    @@all
  end

  def save
    @@all << self
  end

  def self.destroy_all
    @@all.clear
  end

  def self.create(name)
    song = Artist.new(name)
    song.save
    song
  end

#class methods


  def songs
    @songs
  end

  def add_song(song)
    if @songs.include?(song)
      nil
    else
      @songs << song
    end
    if song.artist != self
      song.artist = self
    end
  end

  def genres
    y = []
    self.songs.collect do |song|
      x = song.genre
      if y.include?(x)
        nil
      else
        y << x
      end
    end
    return y
  end


end
