class Genre
  attr_accessor :name, :artist, :songs

  extend Concerns::Findable
  
  @@all = []
  def initialize(name)
    @name = name
    @songs = []
    @@all << self
  end
  
  def self.all
    @@all
  end
  
  def self.destroy_all
    @@all = []
  end
  
  def save
    @@all << self
  end
  
  def self.create(name)
    self.new(name).tap {|a| a.save}
  end
  
  def songs
    @songs
  end
  
  def add_song(song)
    song.genre ||= self
    if !@songs.include?(song)
      @songs << song
    end
  end

  
  def artists
    Song.all.collect { |s| s.artist }.uniq
  end
end