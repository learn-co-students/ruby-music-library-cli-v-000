class Artist
  extend Concerns::Findable
  @@all = []
  attr_accessor :name, :songs, :genres

  def initialize(name)
    @name = name
    @songs = []
  end
  def save
    @@all << self
  end

  def add_song(song)
    song.artist = self if song.artist == nil
    @songs << song unless @songs.include?(song)
  end

  def genres
    @songs.collect do |song|
      song.genre
    end.uniq
  end

  def self.create(name)
    new_artist = self.new(name)
    new_artist.save
    new_artist
  end

  def self.all
    @@all
  end

  def self.destroy_all
    @@all.clear
  end
end
