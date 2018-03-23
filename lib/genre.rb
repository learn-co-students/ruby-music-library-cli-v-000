class Genre
  extend Concerns::Findable
  attr_accessor :name, :songs
  @@all = []

  def initialize(name)
    @name = name
    @songs = []
    self.save
  end

  def save
    @@all << self
  end

  def add_song(song)
    song.genre = self if !song.genre
    @songs << song if !@songs.include?(song)
  end

  def artists
    @songs.collect do |song|
      song.artist
    end.uniq
  end

  def sorted_songs
    @songs.sort{|a, b| a.name <=> b.name}
  end

  def self.all
    @@all.sort{|a, b| a.name <=> b.name}
  end

  def self.destroy_all
    @@all = []
  end
end
