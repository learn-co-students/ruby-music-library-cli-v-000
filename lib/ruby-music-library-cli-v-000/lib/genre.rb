class Genre
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
    @@all = self.all.clear

  end

  def save #calls the all of the Genra class and pushes self
    self.class.all << self
  end

  def self.create(name)
    genre= new(name)
    genre.save
    genre
  end

  def artists
    songs.map(&:artist).uniq
  end



end
