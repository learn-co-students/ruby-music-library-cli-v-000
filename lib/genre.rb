class Genre

  extend Concerns::Findable

  attr_accessor :name, :songs

  @@all = []

  def initialize(name)
    @name = name
    @songs = []
  end

  def artists
    artist_collection = []
    self.songs.each do |song|
      if !artist_collection.include?(song.artist)
        artist_collection << song.artist
      end
    end
    artist_collection
  end

  def save
    @@all << self
  end

  def self.destroy_all
    @@all.clear
  end

  def self.create(name)
    genre = self.new(name)
    genre.save
    genre
  end

  def self.all
    @@all
  end

end
