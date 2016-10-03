require "pry"
class Artist
  extend Concerns::Findable

  attr_accessor :name


  def songs
    @songs
  end

  @@all = []
  #@@songs = []


  def initialize(name, artist=nil)
    @name = name
    @songs = []
  end

  def genres
    x = self.songs.map { |song| song.genre }
    x.uniq
  end


  def self.all
    @@all
  end

  def self.destroy_all
    @@all.clear
  end

  def save
    self.class.all.push(self)
  end

  def self.create(name)
    song = self.new(name)
    song.save
    song
  end

  def does_not_have(this_song)
    self.songs.none? {|song| this_song.name == song.name}
  end

  def add_song(song)
    song.artist=(self) if !song.artist
    self.songs.push(song) if does_not_have(song)
  end



end
