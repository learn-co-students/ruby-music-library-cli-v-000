# require_relative './concerns/findable'
class Genre
  @@all = []
  attr_accessor :name, :songs
  extend Concerns::Findable

  def initialize(name)
    @name = name
    @songs = []
  end

  def self.all
    @@all
  end

  def save
    @@all << self
    self
  end

  def self.destroy_all
    self.all.clear
  end

  def self.create(name)
    # self.new(name).tap {|s| s.save}
    genre = self.new(name)
    genre.save
  end

  def songs
    @songs
  end

  def add_song(song)
    self.songs << song unless self.songs.include? song
    if song.genre != self
      song.genre = self
    end
  end

  def artists
    self.songs.collect {|song| song.artist}.uniq
  end
end
