require_relative "concerns/concerns.rb"
class Artist
  extend Concerns::Findable
  include Concerns::InstanceMethods
  attr_accessor :name, :songs
  @@all = []
  def initialize(name="")
    @songs = []
    @name = name
  end
  def genres
    collection = []
    collection.tap do |coll|
      @songs.each do |song|
        if(!coll.include?(song.genre))
          coll << song.genre
        end
      end
    end
  end

  def add_song(song)
    if(!@songs.include?(song))
      @songs << song
      if(song.artist != self)
        song.artist = self
      end
    end
  end
  def self.all
    @@all
  end
end
