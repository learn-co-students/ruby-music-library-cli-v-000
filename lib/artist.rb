require_relative "./song.rb"
require_relative "./genre.rb"
require_relative "../lib/concerns/findable.rb"



class Artist
  extend Concerns::Findable
  attr_accessor :name

  @@all=[]

  def initialize(name = nil)
    self.name = name
    @songs =[]
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
    x = self.new(name)
    x.save
    x
  end

  def songs
    @songs
  end

  def add_artist(song)
    if song.artist == nil 
      song.artist = self
    end
  end

  def add_song(song)
    self.add_artist(song)
    
    if self.songs.include?(song)
    else
      self.songs << song
    end
  end

  def genres
    genre_array = @songs.collect {|song| song.genre}
    genre_array.uniq
  end

  def self.find_by_name(name)
    self.all.detect {|n| n.name == name}
  end

end