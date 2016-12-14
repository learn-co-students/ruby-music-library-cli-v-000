require_relative '../config/environment.rb'

class Artist
  extend Concerns::Findable
  include Concerns::InstanceMethods

  attr_accessor :name, :songs

  @@all = []

  def initialize(name)
    super
    @songs = []
  end

  def self.all
    @@all
  end

  def add_song(song)
    if song.artist == nil
      song.artist = self
    end
    @songs << song unless @songs.include?(song)
  end

  def genres
    genres = @songs.collect { |song| song.genre }
    genres.uniq
  end
end
