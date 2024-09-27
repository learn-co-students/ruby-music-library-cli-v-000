class Artist
  extend Concerns::Findable
  attr_accessor :name
  attr_reader :songs  #because we initialize it, so it wouldn't change
  @@all = []
  def initialize(name)
    @name = name
    @songs = []
  end
  def self.all
    @@all
  end
  def self.destroy_all
    self.all.clear
  end
  def save
    @@all << self
  end
  def self.create(name)
    name = Artist.new(name)
    name.save
    name
  end
  def add_song(song)
    song.artist = self unless song.artist
    self.songs << song unless songs.include?(song)
  end
  def songs
    @songs
  end
  def genres
    #iterate over the songs collection of songs and set each song to it's genre
    #then return the undoubled ones(if double exclude it) using .uniq method
    songs.collect {|song| song.genre}.uniq
  end

end
