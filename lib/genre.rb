require_relative '../concerns/findable'

class Genre
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

  def self.create(name)
    Genre.new(name).tap{|x| x.save}
  end

  def self.all
    @@all
  end

  def self.destroy_all
    @@all.clear
  end

  def songs
    @songs
  end

  def add_song(song)
    @songs << song
  end

  def artists
    list = self.songs.collect do |song|
      song.artist
    end
    list.uniq
  end

  def to_s
    self.name
  end

end
