class Genre
  attr_accessor :name, :songs

  extend Concerns::Findable

  include Concerns::Saveable

  @@all = []

  def initialize(name)
    super
    self.songs = []
  end

  def add_song(song)
    self.songs.push(song) unless self.songs.include?(song)
    song.genre = self unless song.genre
  end

  def artists
    self.songs.collect{|song| song.artist}.uniq
  end

  def self.all
    @@all
  end

end
