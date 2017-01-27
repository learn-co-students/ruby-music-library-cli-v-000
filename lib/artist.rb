class Artist
  attr_accessor :name, :songs
  extend Concerns::Findable

  @@all = []

  def initialize(name)
    @name = name
    self.save
    @songs = []
  end

  def add_song(song)
    if !@songs.include?(song)
      self.songs << song
      song.artist=(self)
    end
  end

  def save
    if !@@all.include?(self)
      @@all << self
    end
  end

  def genres
    self.songs.collect{|song| song.genre}.uniq
  end

  def self.all
    @@all
  end

  def self.destroy_all
    @@all.clear
  end

  def self.create(name)
    self.new(name)
  end

end
