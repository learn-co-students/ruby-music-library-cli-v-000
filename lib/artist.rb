class Artist
  attr_accessor :name

  @@all = Array.new

  def initialize(name)
    @name = name
    @songs = Array.new
    #@genres = Array.new
    @@all << self
  end

  #START OF CLASS METHODS
  def self.all
    @@all
  end

  def self.destroy_all
    @@all.clear
  end

  def self.create(name)
    self.new(name).save
    return self
  end
  #END OF CLASS METHODS

  def save
    @@all << self
  end

  def add_song(song)
    if song.is_a?(Song)
      @songs << song if !@songs.include?(song)
      song.artist = self if !song.artist
    end
  end

  def songs
    @songs
  end

  def genres
    @songs.map { |song| song.genre }.uniq
  end

end
