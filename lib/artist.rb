class Artist
  extend Concerns::Findable
  attr_accessor :name
  attr_reader :songs

  def initialize(name)
    @name = name
    @songs = []
  end

  @@all = []

  def self.all
    @@all
  end

  def self.destroy_all
    self.all.clear
  end

  def self.create(name)
    self.new(name).tap {|artist| artist.save}
  end
  
  def save
    self.class.all << self
  end

  def add_song(song)
    self.songs << song unless self.songs.include?(song)
    song.artist = self if song.artist == nil
  end

  def genres
    self.songs.collect {|song| song.genre}.uniq
  end
end