require_relative '../lib/concerns/findable'

class Genre
  extend Concerns::Findable
  attr_accessor :name
  attr_reader :artists, :songs
  @@all = []

  def initialize(name)
    @name = name
    @songs = []
  end

  def self.create(name)
    new_genre = self.new(name)
    new_genre.save
    new_genre
  end

  def self.all
    @@all
  end

  def self.destroy_all
    @@all.clear
  end

  def save
    @@all<<self
  end

  def add_song(new_song)
    if new_song.is_a? Song
      if !@songs.include?(new_song)
        @songs<<new_song
        if new_song.genre == nil
          new_song.genre = self
        end
      end
    end
  end

  def artists
    @songs.collect{|song| song.artist}.uniq
  end
end
