require_relative './concerns/findable.rb'

class Artist
  extend Concerns::Findable

  attr_accessor :name, :songs

  @@all = []

  def initialize(name)
    @name = name
    @songs = []
  end

  def self.all
    @@all
  end

  def self.destroy_all
    self.all.clear
  end

  def save
    self.class.all << self
  end

  def self.create(name)
    new(name).tap {|i| i.save}
  end

  def add_song(song)
    if song.artist != self
      song.artist = self
      if !(@songs.include?(song))
        @songs << song
      end
    end
  end

  def genres
    array = []
    self.songs.collect do |song|
      if !(array.include?(song.genre))
        array << song.genre
      end
    end
    array
  end

end
