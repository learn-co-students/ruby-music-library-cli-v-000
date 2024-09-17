class Genre
  attr_accessor :name, :songs, :artists

  extend Concerns::Findable
  @@all = []

  def initialize(name)
    @name = name
    @songs = []
    # @artists = []
  end

  def save
    @@all << self
  end

  def self.all
    @@all
  end

  def self.destroy_all
    @@all.clear
  end

  def self.create(name)
    @name = Genre.new(name)
    @@all << @name
    @name
  end

  def artists
    artists = []
    @songs.each do |song|
      if !artists.include?(song.artist)
        artists << song.artist
      end
    end
    artists
  end
end
