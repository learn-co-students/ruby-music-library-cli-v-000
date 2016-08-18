require "pry"
class Genre
  extend Concerns::Findable

  attr_accessor :name, :songs
  #attr_reader :genre

  @@all = []


  def initialize(name)
    @name = name
    @songs = []
  end


  def self.all
    @@all
  end

  def self.destroy_all
    @@all.clear
  end

  def save
    self.class.all.push(self)
  end

  def self.create(name)
    song = self.new(name)
    song.save
    song
  end

  def artists
    artists = self.songs.map { |song| song.artist}
    artists.uniq
  end



end
