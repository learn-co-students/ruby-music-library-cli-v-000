class Genre
  extend Concerns::Findable
  
  attr_accessor :name
  attr_reader :songs

  @@all = []

  def initialize(name)
    @name = name
    @songs = []
    save
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
    self.new(name)
  end

  def add_song(song)
    song.genre ||= self
    @songs << song if @songs.include?(song) == false
  end

  def artists
    self.songs.map { |song| song.artist }.uniq
  end
end