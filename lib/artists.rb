require 'pry'
class Artist

  extend Memorable::ClassMethods
  include Memorable::InstanceMethods
  extend Concerns::Findable

  attr_accessor :name
  attr_reader :songs

  @@all = []
  def self.all
    @@all
  end

  def initialize(name)
    @name = name
    @songs = []
  end

  def add_song(song)
    if song.artist == nil
      song.artist = self
    end
    if !@songs.include?(song)
      @songs << song
    end
  end

  def genres
     genres = []
     @songs.each do |song|
     genres << song.genre
    end
    genres.uniq
  end


end
