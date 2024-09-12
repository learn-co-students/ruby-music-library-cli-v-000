require 'pry'
class Artist

  extend Concerns::Findable

  attr_accessor :name, :songs

  @@all = []

  def initialize(name)
    self.name = name
    @songs = []
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

  def self.create(name)
    artist = Artist.new(name)
    @@all << artist
    artist
  end

  def add_song(song)
    if @songs.all? {|s| s != song}
      @songs << song
    end
    if song.artist == nil
      song.artist = self
    end
  end

  def genres
    self.songs.collect {|song| song.genre}.uniq
  end

end
