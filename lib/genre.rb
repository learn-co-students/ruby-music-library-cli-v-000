require_relative '../concerns/findable.rb'


class Genre < Basics
  extend Concerns::Findable
  attr_accessor :name, :songs


 @@all = []

  def self.all
    @@all
  end

  def save
    @@all << self
  end

  def initialize(name)
    @name = name
    @songs = []
  end

  def add_song(song)
    @songs << song unless @songs.include?(song)
    song.genre = self unless song.genre == self
  end
  
  def self.create(name)
   new(name).tap{|genre| genre.save}
  end

  def artists
    self.songs.map { |song| song.artist}.uniq
  end
end
