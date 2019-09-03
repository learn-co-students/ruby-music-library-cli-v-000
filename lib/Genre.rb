class Genre

  extend Concerns::Findable

  attr_accessor :name, :songs

  @@all = []

  #Instance Methods

  def initialize(name)
    @name = name
    @songs = []
  end

  def save
    @@all << self
  end

  def artists
    artist_collection = []
    self.songs.each do |song|
      artist_collection.include?(song.artist) ? nil : artist_collection << song.artist
    end
    artist_collection
  end

  #Class Methods

  def self.all
    @@all
  end

  def self.create(name)
    genre = self.new(name)
    genre.save
    genre
  end

  def self.destroy_all
    @@all = []
  end

end
