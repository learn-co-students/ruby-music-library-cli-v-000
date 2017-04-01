require_relative '../lib/concerns/Findable.rb'
class Genre
  @@all = []
  extend Concerns::Findable
  attr_accessor :name, :songs, :artists
  def initialize (name)
    @name = name
    @songs = []
    #self.class.all << self
  end
  def artists#(genre)
    artists_collect = self.songs.collect do |song| song.artist end
    artists_collect.uniq
    #http://ruby-doc.org/core-1.9.3/Array.html#method-i-uniq
  end
  def self.all
      @@all
  end
  def self.destroy_all
      @@all = []
    end
  def save
      @@all<< self
  end
end
