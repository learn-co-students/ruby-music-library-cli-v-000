class Artist
  extend Concerns::Findable
  attr_accessor :name, :songs
  attr_writer
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
    song.artist = self if !song.artist
    @songs << song if !@songs.include?(song)
  end

  def genres
    @songs.collect do |song|
      song.genre
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
