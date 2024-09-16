class Genre
  attr_accessor :name, :songs
  extend Concerns::Findable

  @@all = []

  def initialize(name)
    @name = name
    @songs = []
  end

  def songs
    @songs
  end

  #Returns array of all genre objects
  def self.all
    @@all
  end

  #Clears the all array of all genre instances
  def self.destroy_all
    self.all.clear
  end

  #Saves instance of genre in the 'all' array
  def save
    self.class.all << self
  end

  #instansiates and saves a new instance of the genre class into the 'all' array
  def self.create(name)
    genre = Genre.new(name)
    genre.save
    genre
  end

  def artists
    artists = []
    self.songs.each do |song|
      unless artists.include?(song.artist)
        artists << song.artist
      end
    end
    artists
  end

end
