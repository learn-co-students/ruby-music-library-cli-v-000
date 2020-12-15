class Genre
  extend Concerns::Findable#adding in the class level methods defined in Findable
                            #assumes that there is name variable, acreate and all method
  attr_accessor :name
  attr_reader :songs#, :artist

  @@all = []

  def initialize(name)#the name argument refers to the name of the genre
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
      artists = songs.collect do |song|#collects artists through its songs instead of maintaining its own @artists instance variable
      song.artist# = self unless song.artist == self. returns a collection of artists for all of the genre's songs
      end
      artists.uniq
  end

end
