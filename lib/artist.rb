class Artist
  extend Concerns::Findable
  attr_accessor :name, :songs, :genres

  @@all = []

  def initialize(name)
    @name = name
    @songs = []
  end

  def self.all
    @@all
  end

  def self.destroy_all
    @@all = []
  end

  def save
    @@all << self
  end

  def self.create(name)
    new_artist = Artist.new(name)
    new_artist.save
    new_artist
  end

  def add_song(song)
    @songs << song if !(@songs.include?(song))
    song.artist = self if song.artist == nil
  end

  def genres
    list = []
    @songs.collect do |song|
      list << song.genre if !(list.include?(song.genre))
    end
    list
  end


end
