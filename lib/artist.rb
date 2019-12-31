class Artist
  attr_accessor :name
  attr_reader :songs

  extend Concerns::Findable
  
  def initialize(name)
    @name = name
    @songs = []
  end

  @@all = []

  def self.all
    @@all
  end

  def save
    @@all << self
  end

  def self.destroy_all
    self.all.clear
  end

  def self.create(name)
    Artist.new(name).tap { |a| a.save }
  end

  def add_song(song)
    song.artist = self unless song.artist
    @songs << song unless @songs.include?(song)
  end

  def genres
    self.songs.collect {|s| s.genre}.uniq
  end
end
