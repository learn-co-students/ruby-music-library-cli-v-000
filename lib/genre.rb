class Genre
  extend Concerns::Findable

  attr_accessor :name

  @@all = []
 
  def initialize(name)
    @name = name
    @songs = []
  end
 
  def songs
    @songs
  end
 
  def add_song(song)
    if !@songs.include?(song)
      @songs << song
    end
  end
 
  def artists
    artists = []
    @songs.collect do |song|
      artists << song.artist
    end
    artists.uniq
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
    genre = Genre.new(name)
    self.all << genre
    genre
  end

end