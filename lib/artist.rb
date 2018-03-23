class Artist
  extend Concerns::Findable
  attr_accessor :name, :songs#, :artist
  @@all = []

  def initialize(name)
    @name = name
    @songs = []
    self.save
  end

  def save
    @@all << self
  end

  def add_song(song)
    song.artist = self if !song.artist
    @songs << song if !@songs.include?(song)
  end

  def genres
    @songs.collect do |song|
      song.genre
    end.uniq
  end

  def self.all
    @@all
  end

  def self.destroy_all
    @@all = []
  end

  # def self.create(name)
  #   self.new(name)
  # end
end
