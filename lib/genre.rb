require_relative "./artist.rb"
require_relative "./song.rb"
require_relative "../lib/concerns/findable.rb"



class Genre
  extend Concerns::Findable
  attr_accessor :name

  @@all = []

  def initialize(name)
    self.name = name
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
    x = self.new(name)
    x.save
    x
  end

  def songs
    @songs
  end

  def add_song(song)
    if self.songs.include?(song)
    else
      self.songs << song
    end
  end

  def artists
    artist_array = @songs.collect {|song| song.artist}
    artist_array.uniq
  end

  def self.find_by_name(name)
    self.all.detect {|n| n.name == name}
  end


end