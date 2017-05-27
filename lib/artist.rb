class Artist
  extend Concerns::Findable #takes all methods in the Findable module and adds them as class methods

  attr_accessor :name, :songs
  @@all = []

  def initialize(name)
    @name = name
    @songs = []
  end

  def self.create(name)
    new(name).tap{|a| a.save}
  end

  def self.all
    @@all
  end

  def self.destroy_all
    @@all.clear
  end

  def add_song(song)
    song.artist = self unless song.artist == self
    @songs << song unless @songs.include?(song)
  end

  def genres
    self.songs.collect{|s| s.genre}.uniq
  end

  def to_s
    self.name
  end

  def save
    @@all << self
  end

  def self.find_by_name(name)
    @@all.detect{|artist| artist.name==name}
  end
end
