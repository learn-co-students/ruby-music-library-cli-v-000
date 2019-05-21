class Genre
  extend Concerns::Findable

  attr_accessor :name
  attr_reader :songs
  
  @@all = []

  def initialize(name)
    @name = name
    @songs = []
  end

  def self.all
    @@all
  end

  def self.destroy_all
    @@all =[]
  end

  def save
    @@all << self
  end

  def self.create(name)
    genre = Genre.new(name)
    genre.save
    genre
  end

  def artists
    artists_array = self.songs.map do |song|
                      song.artist
                    end
    artists_array.uniq
  end
end
