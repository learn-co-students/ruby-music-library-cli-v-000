require_relative '../concerns/findable.rb'

class Artist

  extend Concerns::Findable

  attr_accessor :name, :songs


  @@artists = []

  def initialize(name)
    @name = name
    @songs = []
  end

  def self.all
    @@artists
  end

  def self.destroy_all
    self.all.clear
  end

  def save
    @@artists << self
  end

  def self.create(artist)
    new_artist = Artist.new(artist)
    @@artists << new_artist
    new_artist
  end

  def add_song(song)
    song.artist = self if song.artist.nil?
    @songs.detect { |name| @songs << song if name != song }
  end

end
