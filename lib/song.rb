require 'pry'
class Song
  attr_accessor :name, :artist
  @@all = []

  def initialize(name, artist = nil)
    @name = name
    if artist != nil
      @artist = artist
      artist.add_song(self) unless artist.songs.include?(self)
    end
    @songs = []
    #(Video Review: Music Library CLI, OO video: Collaberating Objects) hey song, here's an artist
  end

  def self.all # candidate for module (Class reader)
    @@all
  end

  def self.destroy_all # candidate for module (Class helper)
    @@all.clear
  end

  def save # candidate for module
    @@all << self
  end

  def self.create(name)
    song = Song.new(name)
    song.save
    song
  end

  def songs
    @songs
  end

end
