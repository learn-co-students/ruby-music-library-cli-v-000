class Artist
extend Concerns::Findable

  attr_accessor :name, :artist

  @@all = []

  def initialize(name, artist=nil)
    @name = name
    @songs = []
  end

  def self.all
    @@all
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
   song.artist = self unless song.artist
   @songs << song unless @songs.include?(song)
  end

  def songs
    @songs
  end

  def genres
    songs.collect{|song| song.genre}.uniq
  # binding.pry
  end

  def self.destroy_all
    @@all.clear
  end
end
