require_relative "./concerns/concerns.rb"

class Genre
  extend Concerns::Findable

  @@all = []
  attr_accessor :name

  def initialize(name)
    @name = name
    @songs = []
  end

  def add_song(song)
    self.songs << song unless @songs.include?(song)
  end

  def songs
    @songs
  end

  def artists
    self.songs.collect {|song| song.artist}.uniq
  end

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.create(name)
    self.new(name).tap {|genre| genre.save}
  end

  def self.destroy_all
    @@all.clear
  end
end
