class Artist
  attr_accessor :name, :songs
  @@all = []
  def initialize(name)
    self.name = name
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
    artist = self.new(name)
    artist.save
    artist
  end
  def add_song(song)
      @songs << song if !@songs.include?(song)
      song.artist = self if song.artist != self  
  end
  def genres
    genre_collect = @songs.collect do |song|
      song.genre
    end
    genre_collect.uniq
  end

end