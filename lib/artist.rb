class Artist
  attr_accessor :name

  extend Concerns::Findable

  @@all = []

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
    artist = self.new(name)
    artist.save
    artist
  end

  def add_song(song)
    unless @songs.include?(song)
    @songs << song
    song.artist = self
  end
  end

  def songs
    @songs
  end

  def genres
    @songs.map do |song|
      song.genre
    end.uniq
  end

 def to_s
   self.name
 end

end
