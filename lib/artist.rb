class Artist
  attr_accessor :name, :songs
  extend Concerns::Findable
  # attr_reader :songs
  @@all=[]
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
    new_artist=new(name)
    new_artist.save
    new_artist
  end

  def add_song(song)
    @songs << song if !@songs.include?(song)
    song.artist = self if song.artist!=self
  end

  def genres
    self.songs.collect{|song| song.genre}.uniq
  end
end
