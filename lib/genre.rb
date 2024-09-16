class Genre
  attr_accessor :name, :songs
  @@all = []

  def initialize(name)
    @name = name
    @songs = []
  end

  def name
    @name
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
    genre.save
    return genre
  end

  def songs
    @songs
  end

  def artists
    results = []
    songs = self.songs
    songs.each do |song|
      if results.include?(song.artist) == false
        results << song.artist
      end
    end
    return results
  end

  extend Concerns::Findable

end
