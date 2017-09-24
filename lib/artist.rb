class Artist
  extend Concerns::Findable
  attr_accessor :name, :songs
  @@all = []

  def initialize(name)
    @name = name
    @songs = []
  end

  def save
    @@all << self
  end

  def add_song(song)
    song.artist = self if !song.artist #checks if artist exists and to set itself as artist
    @songs << song if !@songs.include?(song)
  end

  def genres
    self.songs.collect{|song| song.genre}.uniq
  end


  #class methods

  def self.create(name)
    Artist.new(name).tap{|artist| artist.save}
  end

  def self.all
    @@all
  end

  def self.destroy_all
    @@all.clear
  end

  def self.find_by_name(name)
    @@all.detect{|artist| artist.name == name}
  end
end
