class Genre
  extend Concerns::Findable
  
  attr_accessor :name, :songs

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
    new_genre = new(name)
    new_genre.save
    new_genre
  end

  def artists
    artists = []
    @songs.each do |song|
      artists << song.artist unless artists.include?(song.artist)
    end
    artists
  end

end
