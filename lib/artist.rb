class Artist
  attr_accessor :name, :songs
  extend Concerns::Findable

  @@all = []

  def initialize(name)
    @name = name
    @songs = []
  end

  def self.all
    @@all
  end

  def save
    @@all << self
  end

  def self.destroy_all
    @@all.clear
  end

  def self.create(name)
    artist = self.new(name)
    artist.save
    artist
  end

  def add_song(song)
    if !@songs.include?(song)
      @songs << song
    end
    if song.artist != self
      song.artist = self
    end
 
  def genres
    self.songs.collect {|song| song.genre}.uniq
    end
  end
  

end