require_relative '../concerns/findable.rb'

class Genre
  extend Concerns::Findable
  attr_accessor :name
  @@all = []

  def initialize(name)
    @name= name
    @songs = []
  end

  def self.all
    @@all
  end

  def self.destroy_all
    self.all.clear
  end

  def save
    self.class.all << self
  end

  def self.create(name)
    genre = Genre.new(name)
    genre.save
    return genre
  end

  def songs
    @songs
  end

  def add_song(song)
    raise AssociationTypeMismatchError, "#{song.class} received, Story expected." if !song.is_a?(Song)
    if @songs.include?(song) == false
      @songs << song
    end
    if song.genre == nil
      song.genre = self
    end
  end

  def artists
    self.songs.collect {|song|song.artist}.uniq
  end

end
