require_all 'concerns'

class Genre
  attr_accessor :name 
  attr_reader :songs
  extend Concerns::Findable
  include Concerns::Savable
  @@all = []

  def initialize(name)
    @name = name
    @songs = []
  end

  def add_song(song)
    self.songs << song unless songs.include?(song)
    song.genre = self unless song.genre == self
  end

  def self.all
    @@all 
  end

  def self.create(name)
    genre = self.new(name)
    genre.save
    genre
  end

  def artists
    a = songs.collect {|song| song.artist}
    a.uniq
  end
end