class Genre
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

  def self.destroy_all
    self.all.clear
  end

  def save
    self.class.all << self
  end

  def self.create(name)
    genre = self.new(name)
    genre.save
    #self.all << genre
    genre
  end

  def artists
    artist_collector = []
    @songs.each do |song|
      artist_collector.include?(song.artist) ? nil : artist_collector << song.artist
    end
    artist_collector
  end
end
