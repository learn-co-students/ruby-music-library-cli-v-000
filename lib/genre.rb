class Genre
  attr_accessor :name
  @@all = []

  def initialize(name)
    @name = name
    @songs = []
  end

  def songs#getter
    @songs
  end

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.create(name) #custom constructor. Allows creation of object from another environment
    genre = Genre.new(name)
    genre.save
    genre
  end

  def self.destroy_all
    @@all = [] #or self.all.clear
  end

  def artists
      songs.collect do |song|#collects artists through its songs instead of maintaining its own @artists instance variable
      song.artist# = self unless song.artist == self#returns a collection of artists for all of the genre's songs
      end
  end

end
