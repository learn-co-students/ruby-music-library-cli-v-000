class Artist
  extend Concerns::Findable
  
  attr_accessor :name

  @@all = []
 
  def initialize(name)
    @name = name
    @songs = []
  end
 
  def add_song(song)
    if !@songs.include?(song)
      @songs << song
    end
    if song.artist == nil
      song.artist = self
    end
  end
 
  def songs
    @songs
  end
 
  def genres
    genres = []
    self.songs.collect do |song|
      genres << song.genre
    end
    genres.uniq
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
    artist = Artist.new(name)
    self.all << artist
    artist
  end

end