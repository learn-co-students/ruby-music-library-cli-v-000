require_relative './concerns/findable.rb'
class Genre
    extend Concerns::Findable
  attr_accessor :name, :songs
  attr_writer :artists
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
    @@all << self
  end
  def self.create(name)
    genre = self.new(name)
    genre.save
    genre
  end
  def add_song(song)
    if !@songs.include? song
      @songs << song
      song.genre = self
    else
      if !song.genre
        song.genre = self
      end
    end
  end
  def artists
    self.songs.collect {|song| song.artist}.uniq
  end
end
