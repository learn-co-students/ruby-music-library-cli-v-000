require_relative "./concerns/findable.rb"

class Artist
  extend Concerns::Findable

  attr_accessor :name

  @@all = []

  def initialize(name)
    @name = name
    @songs = []
  end

  def songs
    @songs
  end

  def self.all
    @@all
  end

  def self.destroy_all
    @@all = []
  end

  def self.create(name)
    new_item = self.new(name)
    new_item.save
    new_item
  end

  def save
    self.class.all << self
  end

  def add_song(song)
    if !song.artist && !self.songs.include?(song)
      self.songs << song
      song.artist = self
    end
  end

  def genres
    genres = []
    self.songs.each do |song|
      if !genres.include?(song.genre)
        genres << song.genre
      end
    end
    genres
  end

end
