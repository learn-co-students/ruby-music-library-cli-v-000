class Genre
  extend Concerns::Findable
  attr_accessor :name

  @@all = []

  def initialize(name)
    @name = name
    @songs = []
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

  def songs
    @songs

  end

  def self.create(name)
    created_genre = new(name)
    @@all << created_genre.save
  end

  def artists
    unique = []

    songs.map do |song|
      if !unique.include?(song.artist)
        unique << song.artist
      end
    end
    unique

  end

end
