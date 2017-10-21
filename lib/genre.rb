class Genre
  extend Concerns::Findable
  attr_accessor :name, :songs

  @@all = []

  def initialize(name)
    self.name = name
    @@all = []
    self.songs = []
  end

  def artists
    unique = []
    songs.map do |song|
      song.artist
      if(!unique.include?(song.artist))
        unique << song.artist
      end
    end
    unique
  end

  def self.all
    @@all
  end

  def self.destroy_all
    @@all.clear
  end

  def save
    self.class.all << self
  end

  def self.create(name)
    Genre.new(name).tap do |genre|
      genre.save
    end
  end

end
