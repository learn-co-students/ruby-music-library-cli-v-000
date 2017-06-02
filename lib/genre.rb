require_relative "concerns/concerns.rb"
class Genre
  attr_accessor :songs, :name
  extend Concerns::Findable
  include Concerns::InstanceMethods
  
  @@all = []
  def initialize(name="")
    @name = name
    @songs = []
  end
  def add_song(song)
    if(!@songs.include?(song))
      @songs << song
      if(song.genre != self)
        song.genre = self
      end
    end
  end
  def artists
    collection = []
    collection.tap do |coll|
      @songs.each do |song|
        if(!coll.include?(song.artist))
          coll << song.artist
        end
      end
    end
  end
  def self.all
    @@all
  end
end
