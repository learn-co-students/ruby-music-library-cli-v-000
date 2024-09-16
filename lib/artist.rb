require_relative '../concerns/findable.rb'

class Artist

  extend Concerns::Findable
  include Concerns::InstanceMethods
  attr_accessor :name, :songs

  @@all = []

  def initialize(name)
    @name = name
    @songs = []
  end

  def self.all
    @@all
  end

  def self.all_names
    self.all.collect { |artist| artist.name }
  end

  def self.destroy_all
    self.all.clear
  end

  def song_titles
    self.songs.collect { |song| song.name }
  end

  def add_song(song)
    if !self.song_titles.include?(song.name)
      self.songs << song
      if !song.artist
        song.artist = self
      end
    end
  end

  def genres
    genres = self.songs.collect { |song| song.genre }
    genres.uniq
  end

end