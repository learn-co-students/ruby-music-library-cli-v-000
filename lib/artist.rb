class Artist
  attr_accessor :name, :songs

  extend Concerns::Findable

  include Concerns::Saveable

  @@all = []

  def initialize(name)
    super
    self.songs = []
  end

  def add_song(song)
    songs.push(song) unless songs.include?(song)
    song.artist = self unless song.artist
  end

  def genres
    self.songs.collect{|song| song.genre}.uniq
  end

  def self.all
    @@all
  end

end
