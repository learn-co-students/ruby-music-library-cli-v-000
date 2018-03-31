require_relative '../lib/concerns/memorable'
require_relative '../lib/concerns/findable'

class Artist

  extend Concerns::Memorable::ClassMethods
  include Concerns::Memorable::InstanceMethods
  extend Concerns::Findable
  extend Concerns::Findable::ClassMethods
  include Concerns::Findable::InstanceMethods

  attr_accessor :name, :genre, :song, :songs

  @@all = []

  def initialize(name)
    @name = name
    @songs = []
  end

  def self.all
    @@all
  end

  def song=(song)
    @song = song
    @song.artist = self
  end

  def add_song(song)
    if !@songs.include?(song)
      @songs << song
    end
    if song.artist == nil
      song.artist = self
    end
  end

  def genres
    @genres = []
    self.songs.each do |song|
      if !@genres.include?(song.genre)
        @genres << song.genre
      end
    end
    @genres
  end

  def artist=(artist)
    @artist = artist
  end

  def self.create(name)
    artist = self.new(name)
    artist.save
    artist
  end

end
