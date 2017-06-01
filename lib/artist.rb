require_relative "concerns/concerns.rb"
class Artist
  extend Concerns::Findable
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
  def save
    self.class.all << self
  end
  def self.destroy_all
    self.all.clear
  end
  def self.create(name)
    self.new(name).tap{|a| a.save}
  end
end
