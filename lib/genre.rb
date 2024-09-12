class Genre
  extend Concerns::Findable
  attr_accessor :name, :songs
  @@all = []

  def initialize(name)
    @name = name
    @songs = []
  end

  def save
    @@all << self
  end

  def self.all
    @@all
  end

  def self.create(genre)
    newgenre = Genre.new(genre)
    newgenre.save
    newgenre
  end

  def artists
    artists = []
    self.songs.each do|song|
      artists << song.artist
    end
    artists.uniq
  end

  def add_song(song)
    @songs << song unless @songs.include?(song)
  end

  def self.destroy_all
    @@all.clear
  end

end
