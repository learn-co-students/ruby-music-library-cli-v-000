class Artist
  #An Artist has many songs
  attr_accessor :name, :songs

  @@all = []

  def initialize(name)
    @name = name
    @songs = [] #initializes with an Artist instance
  end

  def self.all
    @@all
  end

  def self.destroy_all
    self.all.clear
  end

  def save
    self.class.all << self
  end

  def self.create(name)
    artist = self.new(name).tap do |artist|
      artist.save
    end
  end

  def add_song(song)
    @songs << song
    #song.artist = self
  end
end
