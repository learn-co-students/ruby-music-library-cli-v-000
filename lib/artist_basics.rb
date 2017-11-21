class Artist
  attr_accessor :name
  attr_reader :songs
  extend Concerns::Findable

  @@all = []

  def initialize(name)
    @name = name
    @songs = []
  end

  def self.all
    @@all
  end

  def self.destroy_all
    @@all.clear
  end

  def save
    @@all << self
  end

  def self.create(name)
    thing= self.new(name)
    thing.save
    thing
  end

  def genres
    @songs.collect {|song| song.genre}.uniq
  end


  def add_song(song)
    @songs.include?(song) ? "This song is already added" : @songs << song
    song.artist == nil ? song.artist = self : song.artist
  end
end
