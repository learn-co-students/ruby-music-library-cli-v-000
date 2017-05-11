require_relative './concerns/findable.rb'

class Genre
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
    if song.genre != self
      song.genre = self
        if !(@songs.include?(song))
          @songs << song
        end
    end
  end

  def artists
    array = []
    self.songs.collect do |song|
      if !(array.include?(song.artist))
        array << song.artist
      end
    end
    array
  end

end
