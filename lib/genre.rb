class Genre
  extend Concerns::Findable
  attr_accessor :genre, :name

  def initialize(name)
    @name = name
    @songs = []
  end

  def songs
    @songs
  end

  @@all = []

  def self.all
    @@all
  end

  def self.destroy_all
    self.all.clear
  end

  def save
    self.class.all << self
  end

  def self.create(name)
    new_genre = Genre.new(name)
    @@all << new_genre
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




