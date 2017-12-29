require_relative '../concerns/findable.rb'

class Artist

  extend Concerns::Findable

@@all = []

  attr_accessor :name
  attr_reader :songs

  def initialize(name)
    self.name = name
    @songs = []
  end

  def self.all
    @@all
  end

  def self.destroy_all
    self.all.clear
  end

  def save
    Artist.all << self
  end

  def self.create(name)
    artist = Artist.new(name)
    artist.save
    artist
  end

  def add_song(song)
    if song.artist != self
      song.artist = self
    end
    if !self.songs.include?(song)
      self.songs << song
    end
  end

  def genres
    songs.map {|song| song.genre}.uniq
  end



end
